package controller;

import model.bean.service.RentType;
import model.bean.service.Service;
import model.bean.service.ServiceType;
import model.service.IRentTypeService;
import model.service.IService;
import model.service.IServiceType;
import model.service.iplm.service_ser.RentTypeService;
import model.service.iplm.service_ser.ServiceSer;
import model.service.iplm.service_ser.ServiceTypeSer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@WebServlet(name = "ServiceServlet", urlPatterns = {"/service"})

public class ServiceServlet extends HttpServlet {
    private IService iService = new ServiceSer();
    //send List RentType (name)  --> select-option
    private IRentTypeService iRentType = new RentTypeService();
    private List<RentType> rentTypeList = iRentType.showList();

    //send List ServiceType (name) --> select-option
    private IServiceType iServiceType = new ServiceTypeSer();
    private List<ServiceType> serviceTypeList = iServiceType.showList();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_service":
                //goi ham createService():
                createService(request, response);
                break;
            default:
                //hien thi list service:
                FuramaServlet.showServiceList(request, response);
                break;
        }
    }


    public void createService(HttpServletRequest request, HttpServletResponse response) {
        //get Request:
        Service service = new Service();
        //TẠO map chứa lỗi NumberFormatEx :
        Map<String, String> isNumberMap = new HashMap<>();

        service.setCode(request.getParameter("code"));
        service.setServiceName(request.getParameter("name"));
        service.setStandardRoom(request.getParameter("standardRoom"));
        service.setOtherConvenienceDes(request.getParameter("otherConvenienceDes"));
        service.setRentTypeId(Integer.parseInt(request.getParameter("rentTypeId")));
        service.setServiceTypeId(Integer.parseInt(request.getParameter("serTypeId")));

        //numberFormatEx - area:
        try {
            service.setArea(Double.parseDouble(request.getParameter("serArea")));
        } catch (NumberFormatException e) {
            isNumberMap.put("areaIsNumber", "Vui lòng nhập số");
        }
        //numberFormatEx - maxPeople:
        try {
            service.setMaxPeople(Integer.parseInt(request.getParameter("maxPeople")));
        } catch (NumberFormatException e) {
            isNumberMap.put("maxPeopleIsNumber", "Vui lòng nhập số");
        }

//        numberFormatEx - poolArea:
        if (!request.getParameter("poolArea").equals("")) { //Room: NOT HAVE
            try {
                service.setPoolArea(Double.parseDouble(request.getParameter("poolArea")));
            } catch (NumberFormatException e) {
                isNumberMap.put("poolAreaIsNumber", "Vui lòng nhập số");
            }
        }

            //numberFormatEx - floor:
            if (!request.getParameter("floors").equals("")) {  //Room: NOT HAVE
                try {
                    service.setFloors(Integer.parseInt(request.getParameter("floors")));
                } catch (NumberFormatException e) {
                    isNumberMap.put("floorIsNumber", "Vui lòng nhập số");
                }
            }

            //numberFormatEx - cost:
            try {
                service.setCost(Double.parseDouble(request.getParameter("cost")));
            } catch (NumberFormatException e) {
                isNumberMap.put("costIsNumber", "Vui lòng nhập số");
            }

            //gọi hàm create-get list ValidateMes:
            Map<String, String> validateMesMap = iService.createService(service);   //NOTE: nếu gọi khi chưa set giá trị cho đối tượng --> lỗi NullPointerEx
            //nối 2 map : validate+isNumber vs nhau:
            validateMesMap.putAll(isNumberMap);
            // hien thi Validate-jsp:
            String message = validateMesMap.get("messFromCreateFunction");
            try {
                if (message != null) {
                    if (message.equals("Create new Service successfully!")) {
                        request.setAttribute("message", message);
                        FuramaServlet.showServiceList(request, response);
                    } else {
                        request.setAttribute("message", message);
                        request.setAttribute("serObj", service);  //hien thi lai thong tin da nhap
                        request.setAttribute("rentTypeList", rentTypeList);
                        request.setAttribute("serviceTypeList", serviceTypeList);
                        request.setAttribute("validateMesMap", validateMesMap);
                        request.getRequestDispatcher("furama/service/service_create.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("serObj", service);  //hien thi lai thong tin da nhap
                    request.setAttribute("rentTypeList", rentTypeList);  //select-option
                    request.setAttribute("serviceTypeList", serviceTypeList); //select-option
                    request.setAttribute("validateMesMap", validateMesMap);
                    request.getRequestDispatcher("furama/service/service_create.jsp").forward(request, response);
                }
            } catch (ServletException | IOException e) {
                e.printStackTrace();
            }
        }

    //NumberFormatEx - Int
    protected String isIntNumber(String stringNumber) {
        try {
            Integer.parseInt(stringNumber);
        } catch (NumberFormatException ex) {
            return "Vui lòng nhập số";
        }
        return null;
    }

    //NumberFormatEx - double
    protected String isDoubleNumber(String stringNumber) {
        try {
            Double.parseDouble(stringNumber);
        } catch (NumberFormatException ex) {
            return "Vui lòng nhập số";
        }
        return null;
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "create_service":
                //goi ham ShowCreateForm():
                ShowCreateForm(request, response);
                break;
            default:
                //hien thi list service:
                FuramaServlet.showServiceList(request, response);
        }
    }

    //ham ShowCreateForm:
    public void ShowCreateForm(HttpServletRequest request, HttpServletResponse response) {
        //forward --> service_create.jsp
        request.setAttribute("rentTypeList", rentTypeList);
        request.setAttribute("serviceTypeList", serviceTypeList);
        try {
            request.getRequestDispatcher("furama/service/service_create.jsp").forward(request, response);
        } catch (ServletException | IOException e) {
            e.printStackTrace();
        }
    }
}
