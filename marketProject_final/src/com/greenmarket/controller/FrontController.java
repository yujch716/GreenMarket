package com.greenmarket.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import cartVO.CartVO;
import memberDAO.MemberDAO;
import memberVO.MemberVO;
import orderDAO.OrderDAO;
import orderVO.OrderVO;
import productDAO.ProductDAO;
import productVO.ProductVO;

/**
 * Servlet implementation class FrontController
 */
//@WebServlet("/FrontController")
@WebServlet("*.do")
public class FrontController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * Default constructor.
	 */
	public FrontController() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("UTF-8");
		response.setCharacterEncoding("UTF-8");
		String c = request.getRequestURI().substring(request.getContextPath().length());

		String str = null;

		switch (c) {
		case "/managerMain.do":

			str = "ad_mainPsge.jsp";
			break;

		case "/managerMembers.do":

			str = "ad_memberPage.jsp";
			break;

		case "/managerOrders.do":

			str = "ad_orderPage.jsp";
			break;

		// 관리자 페이지 물품 수량 변경
		case "/change.do":
			String name = request.getParameter("name");
			int num = Integer.parseInt(request.getParameter("num"));
			ProductDAO pdao = null;
			try {
				pdao = new ProductDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			pdao.update_product(num, name);
			str = "close.jsp";

			break;

		// 관리자페이지 유저목록조회
		case "/ad_member.do":
			ArrayList<MemberVO> mArr = null;
			try {
				MemberDAO mdao = new MemberDAO();
				mArr = mdao.getAllInfo();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("mArr", mArr);
			str = "ad_memberPage.jsp";
			break;

		// 관리자페이지 유저 주문내역 조회
		case "/ad_order.do":
			ArrayList<OrderVO> orArr = null;
			try {
				OrderDAO odao = new OrderDAO();
				orArr = odao.getAllInfo();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			request.setAttribute("orArr", orArr);
			str = "ad_orderPage.jsp";
			break;
			
		//관리자페이지 상품 등록
		case "/pro_insert.do":
			String add_name = request.getParameter("pro_name");
			int add_price = Integer.parseInt(request.getParameter("pro_price"));
			String add_dec = request.getParameter("pro_dec");
			int add_amount = Integer.parseInt(request.getParameter("pro_amount"));
			String add_cate = request.getParameter("pro_cate");
			String add_uri = request.getParameter("pro_uri");
						
			ProductDAO proindao = null;
					
			try {
				proindao = new ProductDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			try {
				proindao.insert_product(add_name, add_price, add_dec, add_amount, add_cate, add_uri);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			str = "mainPage.jsp";
			break;

		//상품 이름으로 검색 (단어포함)
		case "/searchProduct.do":
			String searchProduct = request.getParameter("search");
			ArrayList<ProductVO> search_arr = null;
			System.out.println(searchProduct);
			try {
				ProductDAO search_dao = new ProductDAO();
				search_arr = search_dao.pro_search(searchProduct);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("cate", search_arr);
			str= "searchPage.jsp?cate1=" + searchProduct;
	
			break;
				
		// 메인페이지 카테고리
		case "/view_cate.do":
			ArrayList<ProductVO> cate_arr = null;
			String cate1 = request.getParameter("cate1");
			try {
				ProductDAO cate_dao = new ProductDAO();
				cate_arr = cate_dao.viewCate(cate1);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("cate", cate_arr);
			str = "searchPage.jsp?cate1=" + cate1;
			break;

		// 상세페이지 (상세보기 눌렀을때)
		case "/detail.do":
			String detail_name = request.getParameter("cate2");
			ProductVO d_vo = null;
			try {
				ProductDAO d_dao = new ProductDAO();
				d_vo = d_dao.pro_detail(detail_name);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			request.setAttribute("d_vo", d_vo);

			str = "detailPage.jsp";
			break;

		// 회원정보 수정
		case "/memUpdate.do":
			MemberDAO memupdao = null;
			MemberVO upmv = null;

			String up_pw = request.getParameter("pw");

			String up_tel = request.getParameter("tel");
			String addr1 = request.getParameter("addr");
			// 여기까지 수정된 내용이 넘어온다
			String up_sname = request.getParameter("sname");
			// 링크시 선택한 이름을 계속 넘겨받고 있다
			try {
				memupdao = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}

			try {
				memupdao.update_member(up_pw, up_tel, addr1, up_sname);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			str = "my_infoPage.jsp";
			break;

		// 회원탈퇴
		case "/memDelete.do":
			MemberDAO memdeldao = null;
			String del_memId = request.getParameter("del_id");

			try {
				memdeldao = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			try {
				memdeldao.delete_member(del_memId);
			} catch (SQLException e1) {
				e1.printStackTrace();
			}
			HttpSession session5 = request.getSession();
			session5.removeAttribute("cart_session");
			session5.removeAttribute("log");
			str = "mainPage.jsp";
			break;

		// 회원가입
		case "/memJoin.do":
			String jo_id = request.getParameter("id");
			String jo_pw = request.getParameter("pw");
			String jo_name = request.getParameter("name");
			String jo_tel = request.getParameter("tel");
			String jo_addr = request.getParameter("addr");

			MemberDAO memjodao = null;

			try {
				memjodao = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			try {
				memjodao.join_member(jo_id, jo_pw, jo_name, jo_tel, jo_addr);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			str = "mainPage.jsp";
			break;
			
			//한명의 회원정보를 검색하여 출력
		case "/memSearchOne.do" :
			MemberDAO memdao =null;
			MemberVO mv = null;
			try {
				memdao = new MemberDAO();
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			String id1 = request.getParameter("name");
			
			try {
				mv = memdao.getInfo_mem(id1);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			
			request.setAttribute("sname", id1);
			request.setAttribute("smv", mv);
			str = "my_infoPage.jsp";
			break;
		

			//ID 중복인지 체크
			case "/memCheckID.do" :
				MemberDAO memCheckdao = null;
				int result = -1;
				try {
					memCheckdao = new MemberDAO();
					
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				String user_id = request.getParameter("userid");
				//System.out.println("user_id="+user_id);
				try {
					result = memCheckdao.isID(user_id);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				//System.out.println("result="+result);

				//request.setAttribute("result", result);//null..
				//request.setAttribute("id", user_id);//null..
				str = "joinPageCheckID.jsp?result="+result+"&id="+user_id;
				break;	
				
				
			//로그인
			case "/login.do" :
				MemberDAO mem_log = null;
				ArrayList<MemberVO> memArr = null;
				String log_id = request.getParameter("id");
				String log_pw = request.getParameter("pw");
				boolean log_check = false;
				try {
					mem_log = new MemberDAO();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				try {
					memArr = mem_log.getAllInfo();
				} catch (SQLException e) {
					e.printStackTrace();
				}
			
				
				for (MemberVO tmp : memArr) {
					if(log_id.equals(tmp.getId())) {
						if(log_pw.equals(tmp.getPw())) {
							if(!log_id.equals("root")){
							HttpSession session = request.getSession();
							session.setAttribute("log", tmp);
							log_check = true;
							str = "mainPage.jsp";
							}
							else if (log_id.equals("root")) {
								HttpSession session = request.getSession();
								session.setAttribute("log", tmp);
								log_check = true;
								str = "ad_mainPage.jsp";
							}
						}else {
							response.setContentType("text/html; charset=UTF-8"); 
							PrintWriter writer = response.getWriter(); 
							writer.println("<script>alert('비밀번호를 확인해주세요'); location.href='"+"loginPage.jsp"+"';</script>"); 
							writer.close();
							str = "login.jsp";	
						}
					}
					
				}
				if(log_check == false) {
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>alert('아이디를 확인해주세요'); location.href='"+"loginPage.jsp"+"';</script>"); 
				writer.close();
				str = "login.jsp";
				}
				break;
		
				
			//로그아웃
			case "/logout.do":
				HttpSession session = request.getSession();
				//session.getAttribute("log");
				session.removeAttribute("log");
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writer = response.getWriter(); 
				writer.println("<script>alert('로그아웃이 정상적으로 되었습니다'); location.href='"+"mainPage.jsp"+"';</script>"); 
				writer.close();
				str = "mainPage.jsp";
				break;
		
				
				//id 찾기 (이름&전화번호)
			case "/id_search.do":
				MemberDAO memIDdao = null;
				String search_id = null;
				try {
					memIDdao = new MemberDAO();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				String searchByName = request.getParameter("search_name");
				String searchByTel = request.getParameter("search_tel");
				try {
					search_id = memIDdao.search_id(searchByName, searchByTel);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writerID = response.getWriter();
				if(search_id != null)//id가 존재하면 알려줌
					writerID.println("<script>alert('아이디는 "+search_id+" 입니다'); self.close();</script>");
				else	//아이디가 없으면
					writerID.println("<script>alert('아이디가 존재하지 않습니다. 이름과 전화번호를 확인 바랍니다.'); self.close();</script>");
				writerID.close();			//self.close  ==  popup close   cuz now popup
					
				return;//not break..  cuz now popup
			
				
			//pw 찾기 (이름&아이디)
			case "/pw_search.do":
				MemberDAO memPWdao = null;
				String search_pw = null;
				try {
					memPWdao = new MemberDAO();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				String searchPWByName = request.getParameter("search_name");
				String searchPWByID = request.getParameter("search_id");
				try {
					search_pw = memPWdao.search_pw(searchPWByID, searchPWByName);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				System.out.println("search_pw="+search_pw);		
				
				response.setContentType("text/html; charset=UTF-8");
				PrintWriter writerPW = response.getWriter();
				if(search_pw != null)//id가 존재하면 알려줌
					writerPW.println("<script>alert('비밀번호는 "+search_pw+" 입니다'); self.close();</script>");
				else	//아이디가 없으면
					writerPW.println("<script>alert('아이디와 이름을 확인 바랍니다.'); self.close();</script>");
				writerPW.close();			//self.close  ==  popup close   cuz now popup

				return;//not break..  cuz now popup		
				
				
				
				
				
			//장바구니	
			case "/cart.do":
				String cart_name = request.getParameter("cart_name");
				int cart_amount = Integer.parseInt(request.getParameter("cart_amount"));
					
				CartVO cart_vo = null;
				ProductVO p_vo = null;
				ProductDAO p_dao = null;
				ArrayList<CartVO> cart_array = null;
				
				try {
					p_dao = new ProductDAO();
				} catch (ClassNotFoundException | SQLException e) {
					e.printStackTrace();
				}
				try {
					p_vo = p_dao.pro_detail(cart_name);
				} catch (SQLException e) {
					e.printStackTrace();
				}
				cart_vo = new CartVO(p_vo , cart_amount);
				
				HttpSession cart_session = request.getSession();
				cart_array =  (ArrayList<CartVO>) cart_session.getAttribute("cart_session");
				
				if (cart_array == null ) {
					cart_array = new ArrayList<CartVO>();
					cart_array.add(cart_vo);
					cart_session.setAttribute("cart_session", cart_array);
				}else {
					cart_session.removeAttribute("cart_session");
					//cart_session.invalidate();
					cart_array.add(cart_vo);
					cart_session.setAttribute("cart_session", cart_array);
				}
				
				str= "my_cartPage.jsp";
				break;
				
			//장바구니 선택 삭제
			case "/cart_remove.do":
				String cart_rm = request.getParameter("cart_rm");
				HttpSession session2 = request.getSession();
				ArrayList<CartVO> cart_arr = (ArrayList<CartVO>) session2.getAttribute("cart_session");
				//session2.removeAttribute("cart_session");
		
				Iterator<CartVO> iter = cart_arr.iterator();
				
				while(iter.hasNext()) {
					CartVO cc = iter.next();
					if(cc.getCart_pvo().getPro_name().equals(cart_rm)) {
						iter.remove();
					}
				}
				
			session2.setAttribute("cart_session", cart_arr);
			str = "my_cartPage.jsp";
			
				break;
				
			//장바구니 전체삭제
			case "/cart_removeAll.do":
				HttpSession session3 = request.getSession();
				session3.removeAttribute("cart_session");
				
				response.setCharacterEncoding("UTF-8");
				response.setContentType("text/html; charset=UTF-8");

				PrintWriter out = response.getWriter();

				out.println("<script>alert('장바구니가 초기화 되었습니다');location.href='mainPage.jsp';</script>"); 
				out.close();
				
				str = "mainPage.jsp";
				break;
				
			case "/pro_del.do":
				String pro_delName = request.getParameter("pro_delName");
				
				ProductDAO del_dao = null;
				
			try {
				del_dao = new ProductDAO();
				del_dao.delete_product(pro_delName);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
			str = "ad_mainPage.jsp";
				break;
				
			case "/pay.do":
				int all_price = Integer.parseInt(request.getParameter("price"));
				request.setAttribute("price", all_price);
				HttpSession session4 = request.getSession();
				ArrayList<CartVO> cart_arr2 =(ArrayList<CartVO>)session4.getAttribute("cart_session");
				MemberVO cart_mvo = (MemberVO)session4.getAttribute("log");
				String order_pay = "";
				String pay_id = null;
				
				OrderDAO odao = null;
				OrderVO ovo = null;
				
				for(CartVO cvo : cart_arr2) {
					order_pay += cvo.getCart_pvo().getPro_name()+" " + String.valueOf(cvo.getCart_amount())+"개 /";

				}
				
				
			try {
				odao = new OrderDAO();
				odao.insert_order(cart_mvo.getId(), order_pay, all_price);
			} catch (ClassNotFoundException | SQLException e) {
				e.printStackTrace();
			}
				
				
				str = "pay.jsp";
				break;
				
		}
			
		RequestDispatcher rd1 = request.getRequestDispatcher(str);
		rd1.forward(request, response);
		
		

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
