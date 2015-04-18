<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Default.aspx.vb" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    Home
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <!-- Main jumbotron for a primary marketing message or call to action -->
    <div class="jumbotron">
      <div class="container">
        <h1>BAIS Student Placement System</h1>
        <p>Over the past several years, the University of Iowa Business Analytics and Information Systems graduates have seen 100% placement rates within 6 months of graduation. The Hawkeye alumni network proudly spans the spectrum from Fortune 500 companies to entrepreneurial start-ups. We invite you to take a look at our recent student placements.</p>
        <p><a class="btn btn-primary btn-lg" href="./ViewPositions.aspx" role="button">View Student Placements &raquo;</a></p>
      </div>
    </div>

    <div class="container">
      <!-- Row of columns -->
        <div class="row">
            <div class="col-md-4">
                <h2>Undergraduate Program</h2>
                <p>As businesses strive to become more profitable, productive, and competitive, there is a growing need to collect, organize, and analyze big data to gain insight on business decisions. At Tippie, the new business analytics and information systems (BAIS) major is where students can navigate the intersections of business, big data, and information technology, a skill set increasingly sought by many companies.

                The BAIS course work provides skills that apply across all functional areas of business, bestowing BAIS majors with flexible career options that span business disciplines. In addition, taking an appropriate combination of course work and capstone projects could earn the student Lean/Six Sigma certification.</p>
                <p><a class="btn btn-default" href="http://tippie.uiowa.edu/management-sciences/bais.cfm" role="button">View details &raquo;</a></p>
           </div>
           <div class="col-md-4">
                <h2>Choose Your Track</h2>
                <p>Our Business Analytics and Information Systems (BAIS) program provides two tracks of study for undergraduate students, while Ph.D. students work closely with our nationally recognized faculty. We specialize in the use of advanced computational and mathematical techniques to solve critical business problems. Our research and instruction specialties include operations management, information systems, and quantitative methods.</p>
                <p><a class="btn btn-default" href="http://tippie.uiowa.edu/management-sciences/" role="button">View details &raquo;</a></p>
            </div>
            <div class="col-md-4">
                <h2>Placement Success</h2>
                <p>While business graduates nationwide have done remarkably well in recent years, BAIS majors have had the best success in salary offers, with an average increase of about 5% each year. In recent years, our graduates have enjoyed a 100% placement success rate, and Department of Labor statistics project a 25% growth rate in employment through the year 2018. And there’s more good news—according to the book 200 Best Jobs for College Graduates, four of the top-five job categories are IT-related. </p>
                <p><a class="btn btn-default" href="http://tippie.uiowa.edu/management-sciences/undergraduate.cfm" role="button">View details &raquo;</a></p>
           </div>
        </div>
    </div>

</asp:Content>

