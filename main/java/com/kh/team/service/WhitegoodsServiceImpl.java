package com.kh.team.service;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Service;

import com.kh.team.dao.WhitegoodsDao;
import com.kh.team.domain.CategoryVo;
import com.kh.team.domain.MemberVo;
import com.kh.team.domain.ProductImgVo;
import com.kh.team.domain.WhitegoodsQnaVo;
import com.kh.team.domain.WhitegoodsReviewVo;
import com.kh.team.domain.WhitegoodsVo;

@Service
public class WhitegoodsServiceImpl implements WhitegoodsService {

	@Inject
	private WhitegoodsDao whitegoodsDao;
	
	@Override
	public List<WhitegoodsVo> getWhitegoodsList(String w_cate_no) throws Exception {
		List<WhitegoodsVo> getWhitegoodsList = whitegoodsDao.getWhitegoodsList(w_cate_no);
		return getWhitegoodsList;
	}

	@Override
	public void updateWhitegoods(WhitegoodsVo whitegoodsVo) throws Exception {
		whitegoodsDao.updateWhitegoods(whitegoodsVo);
	}

	@Override
	public void deleteWhitegoods(int w_no) throws Exception {
		whitegoodsDao.deleteWhitegoods(w_no);
	}

	@Override
	public List<CategoryVo> getFirstCategoryList(String w_cate_no) throws Exception {
		List<CategoryVo> getFirstCategoryList = whitegoodsDao.getFirstCategoryList(w_cate_no);
		return getFirstCategoryList;
	}


	@Override
	public WhitegoodsVo detailWhitegoods(int w_no) throws Exception {
		whitegoodsDao.readUpdate(w_no);
		WhitegoodsVo detailWhitegoods = whitegoodsDao.detailWhitegoods(w_no);
		return detailWhitegoods;
	}

	@Override
	public void userPAlldelete(String m_id) throws Exception {
		whitegoodsDao.userPAlldelete(m_id);
	}

	@Override
	public List<String> productImgList(int p_no) throws Exception {
		List<String> productImgList =whitegoodsDao.productImgList(p_no);
		return productImgList;
	}

	@Override
	public void productImgDelete(int p_no) throws Exception {
		whitegoodsDao.productImgDelete(p_no);
	}

	@Override
	public void imgInsert(WhitegoodsVo whitegoodsVo, ProductImgVo productImgVo) throws Exception {
		String[] files = productImgVo.getImg_name();
		int p_no = whitegoodsVo.getP_no();
		whitegoodsDao.productImgDelete(p_no);
		if(files != null && files.length > 0) {
			for(String img_name : files) {
				whitegoodsDao.imgInsert(p_no,img_name);
			}
		}
	}

	@Override
	public List<WhitegoodsReviewVo> reviewList(int w_no) throws Exception {
		List<WhitegoodsReviewVo> reviewList = whitegoodsDao.reviewList(w_no);
		return reviewList;
	}

	@Override
	public MemberVo sellingMember(String m_id) throws Exception {
		MemberVo sellingMember = whitegoodsDao.sellingMember(m_id);
		return sellingMember;
	}

	@Override
	public List<WhitegoodsQnaVo> getProductQna(int w_no) throws Exception {
		List<WhitegoodsQnaVo> getProductQna = whitegoodsDao.getProductQna(w_no);
		return getProductQna;
	}

}
