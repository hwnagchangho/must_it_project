package com.hch.exam.must_it_project.controller;

import com.hch.exam.must_it_project.service.ProductService;
import com.hch.exam.must_it_project.service.ReviewService;
import com.hch.exam.must_it_project.util.Ut;
import com.hch.exam.must_it_project.vo.Product;
import com.hch.exam.must_it_project.vo.ResultData;
import com.hch.exam.must_it_project.vo.Review;
import com.hch.exam.must_it_project.vo.Rq;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class UsrReviewController {
  private ReviewService reviewService;

  private ProductService productService;
  private Rq rq;

  public UsrReviewController(ReviewService reviewService, ProductService productService, Rq rq) {
    this.reviewService = reviewService;
    this.productService = productService;
    this.rq = rq;
  }

  @RequestMapping("/usr/review/doWrite")
  @ResponseBody
  public String doWrite(String relTypeCode, int relId, String body, String replaceUri) {

    if (Ut.empty(relTypeCode)) {
      return rq.jsHistoryBack("relTypeCode(를) 입력해주세요");
    }

    if (Ut.empty(relId)) {
      return rq.jsHistoryBack("relId(을)를 입력해주세요");
    }


    ResultData<Integer> writeArticleRd = reviewService.writeReview(rq.getLoginedMemberId(), relTypeCode, relId, body);

    if (Ut.empty(replaceUri)) {
      switch (relTypeCode) {
        case "product":
          replaceUri = Ut.f("../product/detail?id=%d", relId);
          break;
      }
    }

    return rq.jsReplace(writeArticleRd.getMsg(), replaceUri);
  }

  @RequestMapping("/usr/review/modify")
  public String  modify(int id, String replaceUri, Model model) {

    Review review = reviewService.getForPrintReview(rq.getLoginedMember(), id);

    if (review == null) {
      return rq.jsHistoryBack(Ut.f("%d번 리뷰가 존재하지 않습니다.", id));
    }

    if(review.isExtra__actorCanModify() ==false){
      return rq.jsHistoryBack(Ut.f("%d번 리뷰를 수정할 권한이 없습니다.", id));
    }

    String reDataTitle = null;



      switch (review.getRelTypeCode()) {
        case "product":
          Product product = productService.getProduct(review.getRelId());
          reDataTitle = product.getProductName();
      }


    model.addAttribute("reDataTitle", reDataTitle);
    model.addAttribute("review", review);

    return "usr/review/modify";
  }

  @RequestMapping("/usr/review/doModify")
  @ResponseBody
  public String doModify(int id, String body, String replaceUri) {
    if (Ut.empty(id)) {
      return rq.jsHistoryBack("id(을)를 입력해주세요.");
    }

    Review review = reviewService.getForPrintReview(rq.getLoginedMember(), id);

    if(review == null) {
      return rq.jsHistoryBack(Ut.f("%d번 리뷰는 존재하지 않습니다.", id));
    }

    if(review.isExtra__actorCanDelete() == false) {
      return rq.jsHistoryBack(Ut.f("%d번 리뷰를 수정할 권한이 없습니다.", id));
    }

    if (Ut.empty(body)) {
      return rq.jsHistoryBack("body(을)를 입력해주세요.");
    }

    ResultData modifyReviewRd = reviewService.modifyReview(id, body);

    if (Ut.empty(replaceUri)) {
      switch (review.getRelTypeCode()) {
        case "product":
          replaceUri = Ut.f("../product/detail?id=%d", review.getRelId());
          break;
      }
    }

    return rq.jsReplace(modifyReviewRd.getMsg(), replaceUri);
  }

  @RequestMapping("/usr/review/doDelete")
  @ResponseBody
  public String  doDelete(int id, String replaceUri) {

    if (Ut.empty(id)) {
      return rq.jsHistoryBack("id(를) 입력해주세요");
    }

    Review review = reviewService.getForPrintReview(rq.getLoginedMember(), id);

    if (review == null) {
      return rq.jsHistoryBack(Ut.f("%d번 리뷰가 존재하지 않습니다.", id));
    }

    if(review.isExtra__actorCanDelete() ==false){
      return rq.jsHistoryBack(Ut.f("%d번 리뷰를 삭제할 권한이 없습니다.", id));
    }


    ResultData reviewDeleteRd = reviewService.deleteReview(id);

    if (Ut.empty(replaceUri)) {
      switch (review.getRelTypeCode()) {
        case "product":
          replaceUri = Ut.f("../product/detail?id=%d", review.getRelId());
          break;
      }
    }

    return rq.jsReplace(reviewDeleteRd.getMsg(), replaceUri);
  }
}

