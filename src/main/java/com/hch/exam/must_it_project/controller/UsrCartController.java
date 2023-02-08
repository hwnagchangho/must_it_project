package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.service.CartService;
import com.hch.exam.must_it_project.service.ProductService;
import com.hch.exam.must_it_project.util.Ut;
import com.hch.exam.must_it_project.vo.Cart;
import com.hch.exam.must_it_project.vo.ProductCom;
import com.hch.exam.must_it_project.vo.Rq;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

@Controller
public class UsrCartController {
  CartService cartService;

  ProductService productService;
  Rq rq;

  public UsrCartController(CartService cartService, ProductService productService, Rq rq) {
    this.cartService = cartService;
    this.productService = productService;
    this.rq = rq;
  }

  @RequestMapping("/usr/cart/list")
  public String showList(HttpSession httpSession, Model model, int userId){

    //cart 정보받아오기
    List<Cart> carts = cartService.getForPrintCarts(userId);

    List<ProductCom> products = new ArrayList<>();

    for(Cart cart : carts){
      ProductCom product = productService.getForPrintProduct(cart.getProductId());
      products.add(product);
    }

    model.addAttribute("carts", carts);
    model.addAttribute("products", products);

    return "/usr/cart/list";
  }

  @RequestMapping("/usr/cart/doAddProduct")
  @ResponseBody
  public int doAddProduct(int userId, int productId){

    //장바구니담긴 상품 정보
    Cart cart = cartService.getForPrintCart(userId, productId);

    if(cart == null){
      cartService.doAddProduct(userId, productId);
      return 1;
    }
    else if(cart.getUserId() == userId && cart.getProductId() == productId){
      return 0;
    }

    cartService.doAddProduct(userId, productId);

    return 1; // 카트에 해당상품있는지 존재유무 확인하고 없으면 담아버린다.
  }

  @RequestMapping("/usr/cart/doDelete")
  @ResponseBody
  public String doDelete(int id) {

    System.out.println("----------------------------------------"+id);
    cartService.deleteProduct(id);

    return rq.jsReplace(Ut.f("%d번 상품을 삭제하였습니다.", id), "/");
  }

}
