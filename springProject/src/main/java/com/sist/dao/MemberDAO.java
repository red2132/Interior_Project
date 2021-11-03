package com.sist.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.sist.mapper.MemberMapper;
import com.sist.vo.MemberVO;

@Repository
public class MemberDAO {
	
    @Autowired
    private MemberMapper mapper; 
    
    public MemberVO isLogin(String id, String pwd)
    {
    	MemberVO vo = new MemberVO();
    	int count = mapper.memberIdCount(id);
    	if(count == 0) // ID�� ���� ���� 
    	{
    		vo.setMsg("NOID");
    	}
    	else
    	{
    		MemberVO dbVO = mapper.memberGetPassword(id);
    		if(pwd.equals(dbVO.getPwd())) //  ��й�ȣ�� ��ġ
    		{
    			vo.setMsg("OK");
    			vo.setId(id);
    			vo.setName(dbVO.getName());
    			vo.setAdmin(dbVO.getAdmin());
    		}
    		else //��й�ȣ�� Ʋ����
    		{
    			vo.setMsg("NOPWD");
    		}
    	}
    	return vo;
    }
    
    // ���̵� �ߺ�üũ 
    public int memberIdCheck(String id)
    {
    	return mapper.memberIdCount(id);
    }
    
    // ȸ������
    public void memberInsert(MemberVO vo)
    {
    	mapper.memberInsert(vo);
    }
    
    // ȸ��Ż��
    public void memberDelete(String id)
    {
    	mapper.memberDelete(id);
    }
    
    // ȸ�� ���� ������ �б�
    public MemberVO memberUpdateData(String id)
    {
    	return mapper.memberUpdateData(id);
    }
    
    // ���� ���� 
    public boolean memberJoinUpdate(MemberVO vo)
    {
    	boolean bCheck = false;
    	MemberVO dbVO = mapper.memberGetPassword(vo.getId());
    	if(dbVO.getPwd().equals(vo.getPwd()))
    	{
    		bCheck = true; // ��й�ȣ�� �´� ���
    		mapper.memberJoinUpdate(vo);
    	}
    	else
    	{
    		bCheck = false; //��й�ȣ�� Ʋ�� ���
    	}
    	return bCheck;
    }
    
    public String memberIdFindTelData(String tel)
    {
    	String msg = "";
    	int count=mapper.memberIdFindTel(tel);
    	
    	// ��ȭ��ȣ ���翩�� Ȯ��
    	if(count == 0)
    	{
    		msg="��ȭ��ȣ�� �������� �ʽ��ϴ�!!";
    	}
    	else
    	{
    		msg = mapper.memberIdFindTelData(tel);
    	}
    	return msg;
    }
    
    // tel / email => UNIQUE 
    public String memberIdFindEmailData(String email)
    {
    	String msg = "";
    	int count = mapper.memberIdFindEmail(email);
    	
    	// ��ȭ��ȣ ���翩�� Ȯ��
    	if(count == 0)
    	{
    		msg="�̸����� �������� �ʽ��ϴ�!!";
    	}
    	else
    	{
    		msg = mapper.memberIdFindEmailData(email); // h***
    	}
    	return msg;
    }
    
    public String memberPwdFindData(String id)
    {
    	String msg = "";
    	int count = mapper.memberIdCount(id);
    	
    	// ���̵� ���翩�� Ȯ��
    	if(count == 0)
    	{
    		msg="���̵� �������� �ʽ��ϴ�!!";
    	}
    	else
    	{
    		msg = mapper.memberPwdFindData(id);
    	}
    	return msg;
    }
    
}

