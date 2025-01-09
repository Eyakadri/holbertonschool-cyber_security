# Web Application Security Module

## Welcome! 🎉

This project will guide you through exploiting **4 types of vulnerabilities** commonly found in web applications.

---

## Scenario

### Brief Discussion:

**Colleague:**  
Hear this, my boss just asked me for a Customer Support Dashboard.  

**Me:**  
And? A dashboard with Support UI, Customer UI, and an Admin Portal would take at least 4 weeks.  

**Colleague:**  
I challenged him to let me complete it in 3 days for a reward. 😉  

**Me:**  
Are you serious? 😲  

**Colleague:**  
Yeah! I’ve got *Paid ChatGPT 4* by my side. 😄  

---

**3 Days Later:**  

**Colleague:**  
I already finished it! Take a look, my friend: [http://web0x00.hbtn](http://web0x00.hbtn)  

**Me:**  
Am I allowed to pentest it? 😏  

**Colleague:**  
Feel free! It’s hack-proof. I trust AI’s code. 😎  

---

## Prerequisites

Before you begin, make sure you have the following tools and resources ready:

- **Kali Linux**: Pre-installed or use a sandbox environment.
- **Network Access**: Through OpenVPN or a sandbox.
- **Web Browser**: We recommend using **Firefox**.
- **Terminal**: For tools like `curl` and `sqlmap`.

---

## Warming Up

### Step 1: Get the Target Machine
- **Endpoint**: [http://web0x00.hbtn/login](http://web0x00.hbtn/login)

### Step 2: Update the `hosts` File
Append the following entry to your `hosts` file:  
```
[target_machine_ip] web0x00.hbtn
```

### Step 3: Test Connectivity

#### Via Terminal:
```bash
┌──(yosri㉿HBTN-LAB)-[~/0x00webfundamentals]
└─$ curl http://web0x00.hbtn
```

**Expected Output:**
```html
<!doctype html>
<html lang="en">
<title>Redirecting...</title>
<h1>Redirecting...</h1>
<p>You should be redirected automatically to the target URL: <a href="/home">/home</a>. If not, click the link.
```

#### Via Browser:
Navigate to [http://web0x00.hbtn](http://web0x00.hbtn).

---

## Repository Information

- **GitHub Repository:** `holbertonschool-cyber_security`
- **Directory:** `web_application_security/0x00_web_fundamentals`
- **File:** `README.md`

Let the hacking begin! 🚀
