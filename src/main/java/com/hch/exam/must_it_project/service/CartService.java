package com.hch.exam.must_it_project.service;

import com.hch.exam.must_it_project.repository.CartRepository;
import com.hch.exam.must_it_project.vo.Cart;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CartService {
  CartRepository cartRepository;

  public CartService(CartRepository cartRepository) {
    this.cartRepository = cartRepository;
  }

  public void doAddProduct(int userId, int productId) {

    cartRepository.doAddProduct(userId, productId);
  }

  public Cart getForPrintCart(int userId, int productId) {
    return cartRepository.getForPrintCart(userId, productId);
  }

  public List<Cart> getForPrintCarts(int userId) {
    return cartRepository.getForPrintCarts(userId);
  }

  public void deleteProduct(int productId) {
    cartRepository.deleteProduct(productId);
  }
}
