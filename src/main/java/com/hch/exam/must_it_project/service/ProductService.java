package com.hch.exam.must_it_project.service;

import com.hch.exam.must_it_project.repository.ProductRepository;
import com.hch.exam.must_it_project.util.Ut;
import com.hch.exam.must_it_project.vo.Category;
import com.hch.exam.must_it_project.vo.Product;
import com.hch.exam.must_it_project.vo.ProductCom;
import com.hch.exam.must_it_project.vo.ResultData;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.File;
import java.util.List;

@Service
public class ProductService {

  ProductRepository productRepository;
  HttpSession httpSession;

  public ProductService(ProductRepository productRepository, HttpSession httpSession) {
    this.productRepository = productRepository;
    this.httpSession = httpSession;
  }

  public List<ProductCom> getForPrintProducts(int id, int page, int itemsCountInAPage) {

    int limitStart = (page - 1) * itemsCountInAPage;
    int limitTake = itemsCountInAPage;

    return productRepository.getForPrintProducts(id, limitStart, limitTake);
  }

  public Category getForPrintCategory(int id) {
    return productRepository.getForPrintCategory(id);
  }

  public int getProductCount(int id) {
    return productRepository.getProductCount(id);
  }

  public ResultData<Integer> writeProduct(Product product) {

    ProductCom dto = new ProductCom();
    dto.setBrandName(product.getBrandName());
    dto.setPrice(product.getPrice());
    dto.setColor(product.getColor());
    dto.setSize(product.getSize());
    dto.setProductCount(product.getProductCount());
    dto.setProductName(product.getProductName());
    dto.setDiscount(product.getDiscount());
    dto.setCategory_id(product.getCategory_id());
    dto.setDescription(product.getDescription());
    dto.setSellerName(product.getSellerName());
    dto.setInstallment(product.getInstallment());
    dto.setDelivery(product.getDelivery());
    dto.setOrigin(product.getOrigin());
    dto.setShippingPlace(product.getShippingPlace());
    dto.setSellType(product.getSellType());
    // product 데이터저장
    if (!product.getImage().getOriginalFilename().isEmpty()) {
      MultipartFile mf = product.getImage();
      String original = mf.getOriginalFilename();
      /// 확장자
      String originalExt = original.substring(original.lastIndexOf("."));
      String store = original;
      String realPath = httpSession.getServletContext().getRealPath("/static/image");
      //"/Users/jaegu/git/baedal/BaedalProject/reviewImg";
      File f = new File(realPath + "/" + store);
      try {
        mf.transferTo(f);
      } catch (Exception e) {
        e.printStackTrace();
      }
      dto.setImage(store);
    }

    productRepository.writeProduct(dto);

    int id= productRepository.getLastInsertId();

    return ResultData.from("S-1", Ut.f("%d번 상품이 등록되었습니다.", id), "id", id);
}

  public ProductCom getForPrintProduct(int id) {
    return productRepository.getForPrintProduct(id);
  }

  public void deleteProduct(int id) {
    productRepository.deleteProduct(id);
  }

  public Product getProduct(int id) {
    return productRepository.getProduct(id);
  }
}
