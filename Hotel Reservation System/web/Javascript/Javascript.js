function HomeMenu(){
    location.href="index.jsp";
}
function SearchRoomMenu(){
    $("#center").load("SearchRooms.jsp");
}
function ContactMenu(){
    $("#center").load("Contact.jsp");
}
function AboutMenu(){
    $("#center").load("About.jsp");
}
function RegisterMenu(){
    $("#center").load("Register.jsp");
}
function Register2(){
    $("#center").load("Register.jsp");
}
function LoginMenu(){
    $("#center").load("Login.jsp");
}
function UserLogout(){
    location.href="index.jsp";
}
function userreport(){
    $("#center").load("UserBookingReport.jsp");
}
function bookroomvalidate(session){
    if(session===null){
        $("#center").load("Login.jsp");
        return false;
    }
}

function userlogin() {
    
}

function SearchRooms(){
    var a,b;
    a = document.getElementById("Checkin").value;
    if (a === "") {
        alert("Enter a Check-in Date");
        return false;
    };
    
    a = document.getElementById("Checkin").value;
    var today = new Date();
    
    if (Date.parse(a)< today) {
        alert("Invalid Check-in date, Please enter future date");
        return false;
    };
    
    b = document.getElementById("Checkout").value;
    if (b === ""){
        alert("Enter a Check-out Date");
        return false;
    };
    
    b = document.getElementById("Checkout").value;
    if (Date.parse(b)<= Date.parse(a)){
        alert("Invalid Check-out Date");
        return false;
    };
    
}

function UserRegistrationValidation(){
    
    var a,b,c,d,e;
    a = document.getElementById("Name").value;
    if(a === ""){
        alert("Enter your Name");
        return false;
    }
    
    b = document.getElementById("Email").value;
    if(b === ""){
        alert("Enter your Email");
        return false;
    }
    
    c = document.getElementById("number").value;
    if(c === ""){
        alert("Enter your Number");
        return false;
    }
    
    d = document.getElementById("password").value;
    if(d === ""){
        alert("Enter your Password");
        return false;
    }
    
    e = document.getElementById("confirmpass").value;
    if(e === ""){
        alert("Confirm your Password");
        return false;
    }
    
    if (d !== e){
        alert("Password does not match");
        return false;
    }
}
function reportsearch(){
    var checkin = document.getElementById("checkin").value;
    var checkout = document.getElementById("checkout").value;
    if(checkout===""){
        console.log("true");
    }
    
    $("#report-content").load("ReportContent.jsp",{checkin:''+checkin+'',checkout:''+checkout+''});
}


//Admin scripting
function adminlogin(){
    var a,b;
    a = document.getElementById("username").value;
    b = document.getElementById("password").value;
    if(a === "admin" && b === "admin"){
        location.href="admin.jsp";
    }else{
        alert("Please enter Correct username or password");
        return false;
    }
}
function adminlogout(){
    location.href="adminlogin.jsp";
}
function adminhome(){
    location.href="admin.jsp";
}
function adminrooms(){
    $("#center").load("adminroom.jsp");
}
function adminroomtype(){
    $("#center").load("adminroomtype.jsp");
}
function adminreport(){
    location.href="adminreport.jsp";
}
function newroomtype(){
    location.href="newroomtype.jsp";
}
function newroom(){
    location.href="newrooms.jsp";
}