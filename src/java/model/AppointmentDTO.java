/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.sql.Date;

/**
 *
 * @author Viet
 */
public class AppointmentDTO {

    private int id;
    private int userId;
    private Date appointmentDate;
    private Date appointmentTime;
    private String purpose;
    private String status;

    public AppointmentDTO(int id, int userId, Date appointmentDate, Date appointmentTime, String purpose, String status) {
        this.id = id;
        this.userId = userId;
        this.appointmentDate = appointmentDate;
        this.appointmentTime = appointmentTime;
        this.purpose = purpose;
        this.status = status;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public void setAppointmentDate(Date appointmentDate) {
        this.appointmentDate = appointmentDate;
    }

    public void setAppointmentTime(Date appointmentTime) {
        this.appointmentTime = appointmentTime;
    }

    public void setPurpose(String purpose) {
        this.purpose = purpose;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public int getId() {
        return id;
    }

    public int getUserId() {
        return userId;
    }

    public Date getAppointmentDate() {
        return appointmentDate;
    }

    public Date getAppointmentTime() {
        return appointmentTime;
    }

    public String getPurpose() {
        return purpose;
    }

    public String getStatus() {
        return status;
    }


}