package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.service.ProductService;
import com.hch.exam.must_it_project.service.ReviewService;
import com.hch.exam.must_it_project.util.Ut;
import com.hch.exam.must_it_project.vo.*;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.List;

@Controller
public class UsrProductController {
  ProductService productService;
  Rq rq;

  ReviewService reviewService;

  public UsrProductController(ProductService productService, ReviewService reviewService, Rq rq) {
    this.productService = productService;
    this.reviewService = reviewService;
    this.rq = rq;
  }

  @RequestMapping("/usr/product/write")
  public String showWrite(HttpServletRequest req){
    return "/usr/product/write";
  }
@RequestMapping("/usr/product/doWrite")
@ResponseBody
public String doWrite(Product product){
  System.out.println(product);

 ResultData<Integer> writeProduct = productService.writeProduct(product);

 return rq.jsReplace(writeProduct.getMsg(),"/");
}

  @RequestMapping("/usr/product/doDelete")
  @ResponseBody
  public String  doDelete(int id) {

    productService.deleteProduct(id);

    return rq.jsReplace(Ut.f("%d번 게시물을 삭제하였습니다.", id), "/");
  }

  @RequestMapping("/usr/product/list")
  public String showList(Model model, int categoryId, @RequestParam(defaultValue = "1") int page){


    //해당 카테고리 정보
    Category category = productService.getForPrintCategory(categoryId);
    model.addAttribute("category", category);

    //상품개수
    int productCnt = productService.getProductCount(categoryId);
    model.addAttribute("productCnt", productCnt);

    //페이징
    int itemsCountInAPage = 4;
    int pagesCount = (int) Math.ceil((double) productCnt / itemsCountInAPage);
    model.addAttribute("pagesCount", pagesCount);
    model.addAttribute("page", page);
    model.addAttribute("categoryId", categoryId);

    // 해당상품정보
    List<ProductCom> products = productService.getForPrintProducts(categoryId, page, itemsCountInAPage);
    model.addAttribute("products", products);


    return "/usr/product/list";
  }

  @RequestMapping("/usr/product/detail")
  public String showDetail(Model model, int id){

//    Product product = productService.getForPrintProduct(id); product에서 image가 변수타입이 MultipartFile이여서 image를 못받아옴

    ProductCom product = productService.getForPrintProduct(id);

    System.out.println(product);

    model.addAttribute("product", product);

//    리뷰정보
   List<Review> reviews = reviewService.getForPrintReplies(rq.getLoginedMember(), "product", id);

    model.addAttribute("reviews", reviews);

    return "/usr/product/detail";
  }

}
