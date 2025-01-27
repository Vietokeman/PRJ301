package Utils;

import java.util.Properties;
import java.util.regex.Pattern;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class EmailUtils {

    private final String eFrom = "vietbmt19@gmail.com";
    private final String ePass = "ttwqrlalucqpeqon";

    // Check email validity
    public boolean isValidEmail(String email) {
        return Pattern.compile("^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\\.[A-Z|a-z]{2,}$", Pattern.CASE_INSENSITIVE)
                .matcher(email)
                .matches();
    }

    private Authenticator getAuthenticator() {
        return new Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(eFrom, ePass);
            }
        };
    }

    public void sendEmail(String subject, String message, String to) {
        // Properties
        Properties props = new Properties();

        // SMTP server settings
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        // Session instance
        Session session = Session.getInstance(props, getAuthenticator());

        try {
            MimeMessage msg = new MimeMessage(session);
            msg.addHeader("Content-type", "text/HTML; charset=UTF-8");
            msg.setFrom(new InternetAddress(eFrom));
            msg.setRecipients(Message.RecipientType.TO, InternetAddress.parse(to, false));
            msg.setSubject(subject, "UTF-8");
            msg.setContent(message, "text/html; charset=UTF-8");
            Transport.send(msg);
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
    }

    public String subjectContact(String name) {
        return "ClothesShop - Chào " + name + " cảm ơn bạn vì đã liên hệ với chúng tôi";
    }

    public String subjectNewOrder() {
        return "ClothesShop - Đặt hàng thành công";
    }

    public String subjectSubsribe() {
        return "ClothesShop - bạn có thông báo mới";
    }

    public String subjectForgotPass() {
        return "ClothesShop - mã code xác nhận";
    }

    public String messageNewOrder(String name, String appointmentDate, String appointmentTime, String purposeAppointment) {
        return "<!DOCTYPE html>\n"
+ "<html>\n"
+ "    <head>\n"
+ "        <title>Appointment Confirmation</title>\n"
+ "        <meta charset=\"UTF-8\">\n"
+ "        <meta name=\"viewport\" content=\"width=device-width, initial-scale=1.0\">\n"
+ "    </head>\n"
+ "    <body style=\"font-family:arial, helvetica, sans-serif;\n"
+ "          font-size:14px;\n"
+ "          line-height:20px;\n"
+ "          color: #444;\n"
+ "          background:#e1e1e1;\">\n"
+ "        <table width=\"100%\" class=\"wrapper\" style=\"margin:20px 0;\">\n"
+ "            <tr>\n"
+ "                <td class=\"container\"> \n"
+ "                    <div class=\"content\" style=\"display: block!important;\n"
+ "                         max-width: 600px!important;\n"
+ "                         margin: 0 auto!important;\n"
+ "                         clear: both!important;\n"
+ "                         background:#fff;\n"
+ "                         border-radius:10px;\n"
+ "                         box-shadow:0 0 10px rgba(0, 0, 0, 0.1);\">\n"
+ "                        <table cellspacing=\"20\" width=\"100%\">\n"
+ "                            <tr>\n"
+ "                                <td>\n"
+ "                                    <p class=\"brand\" style=\"margin:5px 0 0; font-size:30px;\n"
+ "                                       margin:20px 0;\"><span style=\"color:#3498db;\">Appointment</span>Service</p> \n"
+ "                                </td>\n"
+ "                            </tr>\n"
+ "                            <tr>\n"
+ "                                <td class=\"border\" style=\"border-top:2px solid #3498db;\n"
+ "                                    border-bottom:2px solid #3498db;\">\n"
+ "                                    <h1 style=\"font-size:24px;\n"
+ "                                        color:#3498db;\n"
+ "                                        margin:30px 0;\">APPOINTMENT CONFIRMATION</h1>\n"
+ "                                    <p style=\"margin:5px 0 0\">Dear " + name + ",</p>\n"
+ "                                    <p style=\"margin:5px 0 0\">Thank you for scheduling an appointment with us. Here are the details of your appointment:</p>\n"
+ "                                    <table style=\"width: 100%;\">\n"
+ "                                        <tr>\n"
+ "                                            <td class=\"label\" style=\"font-weight:bold;\">Date:</td>\n"
+ "                                            <td style=\"color:#3498db;font-weight: bold;\" class=\"value\">" + appointmentDate + "</td>\n"
+ "                                        </tr>\n"
+ "                                        <tr>\n"
+ "                                            <td class=\"label\" style=\"font-weight:bold;\">Time:</td>\n"
+ "                                            <td style=\"color:#3498db;font-weight: bold;\" class=\"value\">" + appointmentTime + "</td>\n"
+ "                                        </tr>\n"
+ "                                        <tr>\n"
+ "                                            <td class=\"label\" style=\"font-weight:bold;\">Purpose:</td>\n"
+ "                                            <td style=\"color:#3498db;font-weight: bold;\" class=\"value\">" + purposeAppointment + "</td>\n"
+ "                                        </tr>\n"
+ "                                    </table>\n"
+ "                                    <p style=\"margin:5px 0 0\">We look forward to seeing you. If you need to reschedule or cancel your appointment, please contact us at least 24 hours in advance.</p>\n"
+ "                                    <p style=\"margin:5px 0 0\">If you have any questions, feel free to call our support hotline: 0977452762.</p>\n"
+ "                                    <p style=\"margin:5px 0 0\">Thank you.</p>\n"
+ "                                </td>\n"
+ "                            </tr>\n"
+ "                            <tr class=\"contact\" style=\"font-size:11px; color:#999;\">\n"
+ "                                <td align=\"center\"> \n"
+ "                                    Appointment Service - 0123 456 789 - appointments@example.com\n"
+ "                                </td>\n"
+ "                            </tr>\n"
+ "                        </table>\n"
+ "                    </div> \n"
+ "                </td>\n"
+ "            </tr>\n"
+ "        </table>\n"
+ "    </body>\n"
+ "</html>\n";

    }

    public static void main(String[] args) {
        EmailUtils handleEmail = new EmailUtils();
        String email = "nguyenkhanhkhaitien@gmail.com";
        String subject = "Appointment Confirmation";
        String message = handleEmail.messageNewOrder("Em Tien", "10 October 2024", "9:00 PM", "Meeting with Mr. Viet");
        handleEmail.sendEmail(subject, message, email);
    }
}
