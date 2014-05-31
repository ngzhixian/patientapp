package com;

import com.ConnectionManager;

import java.sql.*;
import java.util.*;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
/**
 *
 * @author Sean
 */
public class Database {

    public Integer insertPatient(PatientDO patient) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String insertPatient = "INSERT INTO PATIENT_INFO(TITLE, FIRST_NAME, "
                + "LAST_NAME, GENDER, DOB,MOBILE, HOME_NO, "
                + "MEDICAL_FUND,LAST_UPDATE_ID, LAST_UPDATE_DT) "
                + "VALUES (?,AES_ENCRYPT(?,'firstName'),?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Integer patientId = null;
        java.util.Date date = new java.util.Date();
        Timestamp currentTimeStamp = new Timestamp(date.getTime());
        try {
            stmt = conn.prepareStatement(insertPatient, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, patient.getTitle());
            stmt.setString(2, patient.getFirstName());
            stmt.setString(3, patient.getLastName());
            stmt.setString(4, patient.getGender());
            stmt.setString(5, patient.getDob());
            stmt.setString(6, patient.getMobile());
            stmt.setString(7, patient.getHomeNo());
            stmt.setString(8, patient.getMedicalFund());
            stmt.setString(9, "SYSTEM");
            stmt.setTimestamp(10, currentTimeStamp);

            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                patientId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return patientId;

    }

    public int insertAddress(AddressDO address, Integer patientId) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String insertAddress = "INSERT INTO ADDRESS(PATIENT_ID, UNIT_NO, STREET_NAME,STREET_NO, SUBURB, POSTCODE, STATE , LAST_UPDATE_ID, LAST_UPDATE_DT) VALUES (?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Integer addressId = null;
        java.util.Date date = new java.util.Date();
        Timestamp currentTimeStamp = new Timestamp(date.getTime());
        try {
            stmt = conn.prepareStatement(insertAddress, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, patientId);
            stmt.setString(2, address.getUnitNo());
            stmt.setString(3, address.getStreetName());
            stmt.setString(4, address.getStreetNo());
            stmt.setString(5, address.getSuburb());
            stmt.setString(6, address.getPostcode());
            stmt.setString(7, address.getState());
            stmt.setString(8, "SYSTEM");
            stmt.setTimestamp(9, currentTimeStamp);

            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                addressId = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return addressId;
    }

    public ArrayList searchPatient(SearchCriteriaDO searchCrit) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String searchPatient = "SELECT CAST(AES_DECRYPT(p.FIRST_NAME,'firstName')as char) as FIRST_NAME, "
                + "p.LAST_NAME, "
                + "p.GENDER, "
                + "p.DOB, "
                + "p.PATIENT_ID "
                + "FROM PATIENT_INFO p, ADDRESS a WHERE a.PATIENT_ID = p.PATIENT_ID AND ";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList patientList = new ArrayList();
        String sFirstName = searchCrit.getFirstName().toLowerCase();
        String sLastName = searchCrit.getLastName().toLowerCase();
        String sPatientId = searchCrit.getPatientId().toLowerCase();
        String sMobile = searchCrit.getMobile().toLowerCase();
        Integer sOption = searchCrit.getSearchOption();

        String sUnitNo = searchCrit.getUnitNo().toLowerCase();
        String sStreet = searchCrit.getStreet().toLowerCase();
        String sStreetNo = searchCrit.getStreetNo().toLowerCase();
        String sPostCode = searchCrit.getPostcode().toLowerCase();
        String sState = searchCrit.getState().toLowerCase();
        String sSuburb = searchCrit.getSuburb().toLowerCase();

        String searchByName = "lower(CAST(AES_DECRYPT(p.FIRST_NAME,'firstName') as char)) LIKE '%" + sFirstName + "%' AND lower(p.LAST_NAME) LIKE '%" + sLastName + "%'";
        String searchByPatientId = "LOWER(p.patient_id) = '" + sPatientId + "'";
        String searchByMobile = "LOWER(p.mobile) = '" + sMobile + "'";
        String searchByAddress = "LOWER(a.UNIT_NO) = '" + sUnitNo + "'"
                + " AND LOWER(a.STREET_NO) = '" + sStreetNo + "'"
                + " AND LOWER(a.STREET_NAME) = '" + sStreet + "'"
                + " AND LOWER(a.SUBURB) = '" + sSuburb + "'"
                + " AND LOWER(a.POSTCODE) = '" + sPostCode + "'"
                + " AND LOWER(a.STATE) = '" + sState + "'";

        try {

            StringBuilder sb = new StringBuilder(searchPatient);
            if (sOption == 1) {
                if (!sFirstName.isEmpty() && !sLastName.isEmpty()) {
                    sb.append(searchByName);

                } else if (!sPatientId.isEmpty()) {
                    sb.append(searchByPatientId);
                } else if (!sMobile.isEmpty()) {
                    sb.append(searchByMobile);

                }
            } else {
                sb.append(searchByAddress);

            }
            stmt = conn.prepareStatement(sb.toString());

            rs = stmt.executeQuery(sb.toString());

            while (rs.next()) {
                PatientDO patient = new PatientDO();
                patient.setFirstName(rs.getString("FIRST_NAME"));
                patient.setLastName(rs.getString("LAST_NAME"));
                patient.setGender(rs.getString("GENDER"));
                patient.setDob(rs.getString("DOB"));
                patient.setPatientId(rs.getInt("PATIENT_ID"));
                patientList.add(patient);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return patientList;

    }

    public ArrayList retrievePatientRecords(Integer patientId) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String retrievePatientRecord = "SELECT PR.* "
                + "FROM PATIENT_RECORDs PR, PATIENT_RECORD_MAP PRM "
                + "WHERE PRM.RECORD_ID = PR.RECORD_ID AND PRM.PATIENT_ID = '";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList patientRecordsList = new ArrayList();

        try {

            StringBuffer sb = new StringBuffer(retrievePatientRecord);
            sb.append(patientId + "' ORDER BY PRM.LAST_UPDATE_DT DESC");
            System.out.println(sb);

            stmt = conn.prepareStatement(sb.toString());
            rs = stmt.executeQuery(sb.toString());

            while (rs.next()) {
                PatientRecordsDO patientRecords = new PatientRecordsDO();
                patientRecords.setRecordId(rs.getInt("RECORD_ID"));
                patientRecords.setDateOfConsultation(rs.getString("DATE_OF_CONSULTATION"));
                patientRecords.setChiefComplaints(rs.getString("CHIEF_COMPLAINTS"));
                patientRecords.setPresentSymptoms(rs.getString("PRESENT_SYMPTOMS"));
                patientRecords.setOtherSymptoms(rs.getString("OTHER_SYMPTOMS"));
                patientRecords.setTongue(rs.getString("TONGUE"));
                patientRecords.setPulse(rs.getString("PULSE"));
                patientRecords.setTcmDd(rs.getString("TCM_DD"));
                patientRecords.setTcmSd(rs.getString("TCM_SD"));
                patientRecords.setAetPath(rs.getString("AETPATH"));
                patientRecords.setWesternMed(rs.getString("WESTERN_MEDD"));
                patientRecords.setAcupuncture(rs.getString("ACUPUNCTURE"));
                patientRecords.setHerbs(rs.getString("HERBS"));
                patientRecords.setRemedialMassage(rs.getString("REMEDIAL_MASSAGE"));
                patientRecords.setAdvice(rs.getString("ADVICE"));
                patientRecords.setOutcome(rs.getString("OUTCOME"));
                patientRecords.setPrincipleTreatment(rs.getString("PRINCIPLE_TREATMENT"));
                patientRecords.setTreatmentPlan(rs.getString("TREATMENT_PLAN"));
                patientRecords.setPractitionerName(rs.getString("PRACTITIONER_ID"));
                patientRecords.setFinalPatientRecord(rs.getString("FINAL_PATIENT_RECORD"));
                patientRecordsList.add(patientRecords);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return patientRecordsList;

    }

    public ArrayList retrieveSingleDropDownValues(String keyTy) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String retrieveSingleDrop = "SELECT KEY_TY,CD,DECODE,DESCRIPTION FROM MASTER_CD WHERE KEY_TY = '" + keyTy + "'";

        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList masterDrop = new ArrayList();
        try {

            StringBuffer sb = new StringBuffer(retrieveSingleDrop);
            System.out.println(sb);

            stmt = conn.prepareStatement(sb.toString());
            rs = stmt.executeQuery(sb.toString());

            while (rs.next()) {
                MasterDO master = new MasterDO();
                master.setKeyTy(rs.getString("KEY_TY"));
                master.setCd(rs.getString("CD"));
                master.setDecode(rs.getString("DECODE"));
                master.setDescription(rs.getString("DESCRIPTION"));
                masterDrop.add(master);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return masterDrop;
    }

    public ArrayList retrieveDropDownValues() {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String retrieveDropDownValues = "SELECT KEY_TY,CD,DECODE,DESCRIPTION FROM MASTER_CD";

        PreparedStatement stmt = null;
        ResultSet rs = null;
        ArrayList masterDrop = new ArrayList();
        try {

            StringBuffer sb = new StringBuffer(retrieveDropDownValues);
            System.out.println(sb);

            stmt = conn.prepareStatement(sb.toString());
            rs = stmt.executeQuery(sb.toString());

            while (rs.next()) {
                MasterDO master = new MasterDO();
                master.setKeyTy(rs.getString("KEY_TY"));
                master.setCd(rs.getString("CD"));
                master.setDecode(rs.getString("DECODE"));
                master.setDescription(rs.getString("DESCRIPTION"));
                masterDrop.add(master);

            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return masterDrop;
    }

    public ArrayList validateUser(String username, String password) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String validateUser = "SELECT * FROM USER WHERE USERNAME = "
                + "AES_ENCRYPT('" + username + "','userName') "
                + "AND PASSWORD = AES_ENCRYPT('" + password + "','passWord')";
        Boolean validationPass = false;
        ArrayList userArr = new ArrayList();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {

            StringBuffer sb = new StringBuffer(validateUser);
            System.out.println(sb);

            stmt = conn.prepareStatement(sb.toString());
            rs = stmt.executeQuery(sb.toString());

            if (rs.next()) {
                UserDO user = new UserDO();
                user.setDisplayName(rs.getString("DISPLAY_NAME"));
                user.setUserId(rs.getInt("USER_ID"));
                validationPass = true;
                userArr.add(validationPass);
                userArr.add(user);
            } else {
                userArr.add(validationPass);

            }
            System.out.println(userArr.get(0));

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

        return userArr;
    }

    public void removeDropDownValue(String dropDownSelected, String keyTy) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String removeItemSQL = "DELETE FROM MASTER_CD WHERE KEY_TY = '" + keyTy + "'"
                + "AND CD = '" + dropDownSelected + "'";

        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {

            StringBuffer sb = new StringBuffer(removeItemSQL);
            System.out.println(sb);
            stmt = conn.prepareStatement(sb.toString());
            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }

    }

    public void insertDropDownValue(String newItem, String keyTy) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String insertDropDownValue = "INSERT INTO MASTER_CD (KEY_TY, "
                + "DECODE, "
                + "DESCRIPTION, "
                + "LAST_UPDATE_DT, "
                + "LAST_UPDATE_ID)"
                + "VALUES (?,?,?,?,?)";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        java.util.Date date = new java.util.Date();
        Timestamp currentTimeStamp = new Timestamp(date.getTime());
        try {
            stmt = conn.prepareStatement(insertDropDownValue, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, keyTy);
            stmt.setString(2, newItem);
            stmt.setString(3, newItem);
            stmt.setTimestamp(4, currentTimeStamp);
            stmt.setString(5, "SYSTEM");

            stmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    }

    public Integer insertRecord(PatientRecordsDO record, Integer patientId, Integer pracId, String pracName, Boolean update) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        System.out.println("InsertRecord");
        String updatePatientRecord = "UPDATE PATIENT_RECORDS SET CHIEF_COMPLAINTS = ?, PRESENT_SYMPTOMS = ?, OTHER_SYMPTOMS = ?,"
                + "TONGUE = ?, PULSE = ?, TCM_DD = ?, "
                + "TCM_SD= ?,AETPATH = ?, WESTERN_MEDD = ?, "
                + "ACUPUNCTURE = ?, "
                + "HERBS = ?, REMEDIAL_MASSAGE = ?, "
                + "FINAL_PATIENT_RECORD = ?, "
                + "LAST_UPDATE_DT = ?,  "
                + "ADVICE = ?, OUTCOME = ?, "
                + "PRINCIPLE_TREATMENT = ?, "
                + "TREATMENT_PLAN = ? WHERE RECORD_ID = ?";
                

        String insertPatientRecord = "INSERT INTO PATIENT_RECORDS (DATE_OF_CONSULTATION, "
                + "CHIEF_COMPLAINTS, "
                + "PRESENT_SYMPTOMS, "
                + "OTHER_SYMPTOMS, "
                + "TONGUE, "
                + "PULSE, "
                + "TCM_DD, "
                + "TCM_SD, "
                + "AETPATH, "
                + "WESTERN_MEDD, "
                + "ACUPUNCTURE, "
                + "HERBS, "
                + "REMEDIAL_MASSAGE, "
                + "FINAL_PATIENT_RECORD, "
                + "LAST_UPDATE_DT, "
                + "LAST_UPDATE_ID, "
                + "ADVICE, "
                + "OUTCOME, "
                + "PRINCIPLE_TREATMENT, "
                + "TREATMENT_PLAN, "
                + "PRACTITIONER_ID) "
                + "VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Integer recordId = 0;
        java.util.Date date = new java.util.Date();
        Timestamp currentTimeStamp = new Timestamp(date.getTime());
        try {
            if (update == false) {
                stmt = conn.prepareStatement(insertPatientRecord, Statement.RETURN_GENERATED_KEYS);
                stmt.setString(1, record.getDateOfConsultation());
                stmt.setString(2, record.getChiefComplaints());
                stmt.setString(3, record.getPresentSymptoms());
                stmt.setString(4, record.getOtherSymptoms());
                stmt.setString(5, record.getTongue());
                stmt.setString(6, record.getPulse());
                stmt.setString(7, record.getTcmDd());
                stmt.setString(8, record.getTcmSd());
                stmt.setString(9, record.getAetPath());
                stmt.setString(10, record.getWesternMed());
                stmt.setString(11, record.getAcupuncture());
                stmt.setString(12, record.getHerbs());
                stmt.setString(13, record.getRemedialMassage());
                stmt.setString(14, record.getFinalPatientRecord());
                stmt.setTimestamp(15, currentTimeStamp);
                stmt.setInt(16, pracId);
                stmt.setString(17, record.getAdvice());
                stmt.setString(18, record.getOutcome());
                stmt.setString(19, record.getPrincipleTreatment());
                stmt.setString(20, record.getTreatmentPlan());
                stmt.setString(21, pracName);
                stmt.executeUpdate();
                System.out.println(stmt);
            
            } else {
                stmt = conn.prepareStatement(updatePatientRecord);
                stmt.setString(1, record.getChiefComplaints());
                stmt.setString(2, record.getPresentSymptoms());
                stmt.setString(3, record.getOtherSymptoms());
                stmt.setString(4, record.getTongue());
                stmt.setString(5, record.getPulse());
                stmt.setString(6, record.getTcmDd());
                stmt.setString(7, record.getTcmSd());
                stmt.setString(8, record.getAetPath());
                stmt.setString(9, record.getWesternMed());
                stmt.setString(10, record.getAcupuncture());
                stmt.setString(11, record.getHerbs());
                stmt.setString(12, record.getRemedialMassage());
                stmt.setString(13, record.getFinalPatientRecord());
                stmt.setTimestamp(14, currentTimeStamp);
                stmt.setString(15, record.getAdvice());
                stmt.setString(16, record.getOutcome());
                stmt.setString(17, record.getPrincipleTreatment());
                stmt.setString(18, record.getTreatmentPlan());
                stmt.setInt(19, record.getRecordId());
                stmt.executeUpdate();
                System.out.println(stmt);
            }
            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                recordId = rs.getInt(1);
            }

                
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return recordId;
    }

    public Integer insertPatientRecordMap(Integer patientId, Integer recordId) {
        ConnectionManager dbConn = new ConnectionManager();
        Connection conn = dbConn.mySqlConnection();
        String insertPatientRecordMap = "INSERT INTO PATIENT_RECORD_MAP (PATIENT_ID, "
                + "RECORD_ID,"
                + "LAST_UPDATE_ID,"
                + "LAST_UPDATE_DT) "
                + "VALUES (?,?,?,?)";
        PreparedStatement stmt = null;
        ResultSet rs = null;
        java.util.Date date = new java.util.Date();
        Timestamp currentTimeStamp = new Timestamp(date.getTime());
        Integer orderNo = 0;
        try {
            stmt = conn.prepareStatement(insertPatientRecordMap, Statement.RETURN_GENERATED_KEYS);
            stmt.setInt(1, patientId);
            stmt.setInt(2, recordId);
            stmt.setString(3, "SYSTEM");
            stmt.setTimestamp(4, currentTimeStamp);

            stmt.executeUpdate();

            rs = stmt.getGeneratedKeys();
            if (rs.next()) {
                orderNo = rs.getInt(1);
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
        return orderNo;
    }

}
