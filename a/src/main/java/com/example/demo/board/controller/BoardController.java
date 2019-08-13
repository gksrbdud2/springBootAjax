package com.example.demo.board.controller;
 


import java.io.File;
import java.io.IOException;
import java.nio.charset.Charset;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.http.HttpEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.entity.mime.MultipartEntityBuilder;
import org.apache.http.entity.mime.content.FileBody;
import org.apache.http.entity.mime.content.InputStreamBody;
import org.apache.http.entity.mime.content.StringBody;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.util.EntityUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.example.demo.board.domain.BoardVO;
import com.example.demo.board.domain.FileVO;
import com.example.demo.board.service.BoardService;
 
@Controller
public class BoardController {
	
	@Autowired
    BoardService mBoardService;
    
    @RequestMapping("/list")
    private String boardList(Model model) throws Exception{
        
        //model.addAttribute("list", mBoardService.boardListService());
        
        return "list";
    }
    
    @ResponseBody
    @RequestMapping(value = "/get_list", method = RequestMethod.GET)
    public List<BoardVO> get_board() throws Exception {
		return mBoardService.boardListService();
       
    }
    

    @RequestMapping("/insert") //게시글 작성폼 호출  
    @ResponseBody
    private int boardInsert(HttpServletRequest request) throws Exception{
        
        BoardVO board = new BoardVO();
        
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        
        return mBoardService.boardInsertService(board);
    }
    
    @RequestMapping("/detail/{bno}") 
    private String boardDetail(@PathVariable int bno, Model model) throws Exception{
        
        model.addAttribute("detail", mBoardService.boardDetailService(bno));
        
        return "detail";
    }


    @RequestMapping("/updateProc")
    @ResponseBody
    private int boardUpdateProc(HttpServletRequest request) throws Exception{
        
        BoardVO board = new BoardVO();
        board.setSubject(request.getParameter("subject"));
        board.setContent(request.getParameter("content"));
        board.setBno(Integer.parseInt(request.getParameter("bno")));
        
        return mBoardService.boardUpdateService(board);
    }
 
    @RequestMapping("/delete/{bno}")
    @ResponseBody
    private int boardDelete(@PathVariable int bno) throws Exception{
        
        return mBoardService.boardDeleteService(bno);
    }
  

   //MultipartFile 방식
    @RequestMapping(value="/multipartServer", method=RequestMethod.POST)
    public @ResponseBody Map<String, Object> multipartServer(FileVO vo,HttpServletRequest request) {
        System.out.println("Multipart Server Response");
        Map<String, Object> map = new HashMap<String, Object>();
        //클라이언트 페이지로 부터 Httpclient로 받은 parameter값
        map.put("txt", request.getParameter("txt"));
        //클라이언트 페이지로 부터 Httpclient로 받은 multipart parameter값
        map.put("filename", vo.getFileupload().getOriginalFilename());
        map.put("filesize", vo.getFileupload().getSize());
        map.put("flag", "multipart");
        map.put("success", true);
        return map;
    }
    
    
   //Multipart방식 호출을 위한 샘플폼화면 (사용자 페이지)
    @RequestMapping(value="/multipartForm")
    public String multipartForm(HttpServletRequest request, HttpServletResponse response) {
        return "multipartForm";
    }
  
  //파일첨부 MultipartFile Submit
    @RequestMapping(value="/multipartSubmit")
    public void multipartSubmit(HttpServletRequest request,  FileVO vo) {
        CloseableHttpClient httpclient = HttpClients.createDefault();
            try {
                HttpPost httppost = new HttpPost("http://localhost:8080/multipartServer");
                File convFile = new File(vo.getFileupload().getOriginalFilename());
                vo.getFileupload().transferTo(convFile);
                InputStreamBody multipart = new InputStreamBody(vo.getFileupload().getInputStream(), vo.getFileupload().getOriginalFilename());
                
                //Charset.forName("UTF-8") : 한글깨짐 방지를위함
                StringBody txt = new StringBody(request.getParameter("txt"), Charset.forName("UTF-8"));
                //API 서버에 전달하고자하는 PARAMETER
                HttpEntity reqEntity = MultipartEntityBuilder.create().addPart("fileupload", multipart).addPart("txt", txt).build();
                httppost.setEntity(reqEntity);
                CloseableHttpResponse response = httpclient.execute(httppost);
                try {
                    System.out.println(response.getStatusLine());
                    //API서버로부터 받은 JSON 문자열 데이터
                    System.out.println(EntityUtils.toString(response.getEntity()));
                    HttpEntity resEntity = response.getEntity();
                    if (resEntity != null) {
                        System.out.println("Response content length: " + resEntity.getContentLength());
                    }
                } finally {
                    response.close();
                }
            } catch(Exception e){
                e.printStackTrace();
            }finally {
                try {
            httpclient.close();
            } catch (IOException e) {}
            }
    }

}