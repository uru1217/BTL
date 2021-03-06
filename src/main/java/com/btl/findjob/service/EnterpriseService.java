package com.btl.findjob.service;

import java.util.List;

import com.btl.findjob.model.CompanyInfoDTO;
import com.btl.findjob.model.CompanyListVO;
import com.btl.findjob.model.CompanyPersonalDTO;

public interface EnterpriseService {

    public List<CompanyInfoDTO> companyList(String ci_companyName);

    public List<CompanyPersonalDTO> cpList(String ci_companyName);

    public int cpSince(String ci_companyName);

    public int allcprank(String ci_companyName);

    public int allcp(String ci_companyName);

    public int cptotal(String ci_companyName);

    public int alltotalrank(String ci_companyName);

    public int latestallcp(String ci_companyName);

    public int tmin(String ci_companyName);

    public int tmout(String ci_companyName);

    public int alltminrank(String ci_companyName);

    public int alltmoutrank(String ci_companyName);

    public int latestcptotal();

    public List<CompanyListVO> companyList(String userEmail, String ci_companyName);

    public int getSalary(String ci_companyName);
}
