package com.kh.greenfood.board.vo;

import java.sql.Timestamp;
import java.util.List;

import javax.persistence.Entity;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.Data;

@Entity
@Data
public class BoardVO {
	private long bnum; 							//게시글번호
	@Valid
	private BoardCategoryVO boardCategoryVO;  //카테고리
	private String bid; 						//아이디
	private String bname; 					//이름
	@NotNull
	@Size(min=1, max=50, message="제목은 1~50자까지 입력 가능합니다.")
	private String btitle;					//제목
	
	@NotNull(message = "내용을 입력해야 합니다.")
	@Size(min=1, message="내용을 입력해야 합니다.")
	private String bcontent;				//내용
	private int bhit;								//조회수
	@JsonFormat(pattern = "yyyy-MM-dd")
	private Timestamp bcdate;				//등록일
	private Timestamp budate;				//수정일
	private int bgroup;							//답글그룹
	private int bindent;						//답변글의 들여쓰기
	private int bstep;							//답변글의 단계
	private int grade;
	private long mnum;							//메뉴이름번호
	private int hasPicture;					//파일 유무
	//첨부파일
	private List<MultipartFile> files;
}
