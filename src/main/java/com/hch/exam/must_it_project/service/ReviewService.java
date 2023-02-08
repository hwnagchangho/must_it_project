package com.hch.exam.must_it_project.service;

import com.hch.exam.must_it_project.repository.ReviewRepository;
import com.hch.exam.must_it_project.util.Ut;
import com.hch.exam.must_it_project.vo.Member;
import com.hch.exam.must_it_project.vo.ResultData;
import com.hch.exam.must_it_project.vo.Review;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ReviewService {
  private ReviewRepository reviewRepository;
  private MemberService memberService;

  public ReviewService(ReviewRepository reviewRepository, MemberService memberService) {
    this.reviewRepository = reviewRepository;
    this.memberService = memberService;
  }

  public ResultData<Integer> writeReview(int actorId, String relTypeCode, int relId, String body) {

    reviewRepository.writeReview(actorId, relTypeCode, relId, body);

    int id = reviewRepository.getLastInsertId();

    return ResultData.from("S-1", Ut.f("%d번 게시물이 생성되었습니다.", id), "id", id);
  }

  public List<Review> getForPrintReplies(Member actor, String relTypeCode, int relId) {
    List<Review> reviews = reviewRepository.getForPrintReviews(relTypeCode, relId);

    for (Review review : reviews) {
      if(actor == null){
        return reviews; //오류 해결 exam1206에 적어놓음
      }
      updateForPrintData(actor, review);
    }

    return reviews;
  }

  private void updateForPrintData(Member actor, Review review) {
    if (review == null) {
      return;
    }

    ResultData actorCanDeleteRd = actorCanDelete(actor, review);
    review.setExtra__actorCanDelete(actorCanDeleteRd.isSuccess());

    ResultData actorCanModifyRd = actorCanModify(actor, review);
    review.setExtra__actorCanModify(actorCanModifyRd.isSuccess());
  }

  private ResultData actorCanModify(Member actor, Review review) {
    if (review == null) {
      return ResultData.from("F-1", "리뷰가 존재하지 않습니다.");
    }

    if (review.getMemberId() != actor.getId()) {
      return ResultData.from("F-2", "권한이 없습니다.");
    }

    return ResultData.from("S-1", "리뷰 수정이 가능합니다.");
  }

  private ResultData actorCanDelete(Member actor, Review review) {
    if (review == null) {
      return ResultData.from("F-1", "리뷰가 존재하지 않습니다.");
    }

    if (review.getMemberId() != actor.getId()) {
      return ResultData.from("F-2", "권한이 없습니다.");
    }

    return ResultData.from("S-1", "리뷰 삭제가 가능합니다.");
  }

  public Review getForPrintReview(Member actor, int id) {
    Review review = reviewRepository.getForPrintReview(id);

    updateForPrintData(actor, review);

    return review;
  }

  public ResultData deleteReview(int id) {
   reviewRepository.deleteReview(id);

    return ResultData.from("S-1", Ut.f("%d번 리뷰를 삭제하였습니다.", id));
  }

  public ResultData modifyReview(int id, String body) {
    reviewRepository.modifyReview(id, body);

    return ResultData.from("S-1", Ut.f("%d번 리뷰를 수정하였습니다.", id));
  }
}
