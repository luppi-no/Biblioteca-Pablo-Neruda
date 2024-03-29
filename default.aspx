﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Sitio.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Proyecto.WebForm2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Title" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="HeadScript" runat="server">
    <style>
        * {
            margin: 0;
            padding: 0;
            -moz-box-sizing: border-box;
            -o-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            box-sizing: border-box;
        }

        body {
            width: 100%;
            height: 100%;
            font-family: "helvetica neue", helvetica, arial, sans-serif;
            font-size: 10px;
            text-align: center;
        }

        ul {
            margin: 30px auto;
            text-align: center;
        }

        li {
            list-style: none;
            position: relative;
            display: inline-block;
            width: 150px;
            height: 150px;
        }

        @-moz-keyframes rotate {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(-360deg);
            }
        }

        @-webkit-keyframes rotate {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(-360deg);
            }
        }

        @-o-keyframes rotate {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(-360deg);
            }
        }

        @keyframes rotate {
            0% {
                transform: rotate(0deg);
            }

            100% {
                transform: rotate(-360deg);
            }
        }

        .round {
            display: block;
            position: absolute;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            padding-top: 30px;
            text-decoration: none;
            text-align: center;
            font-size: 20px;
            text-shadow: 0 1px 0 rgba(255,255,255,.7);
            letter-spacing: -.065em;
            font-family: "Hammersmith One", sans-serif;
            -webkit-transition: all .25s ease-in-out;
            -o-transition: all .25s ease-in-out;
            -moz-transition: all .25s ease-in-out;
            transition: all .25s ease-in-out;
            box-shadow: 2px 2px 7px rgba(0,0,0,.2);
            border-radius: 300px;
            z-index: 1;
            border-width: 4px;
            border-style: solid;
        }

            .round:hover {
                width: 130%;
                height: 130%;
                left: -15%;
                top: -15%;
                font-size: 33px;
                padding-top: 38px;
                -webkit-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
                -o-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
                -moz-box-shadow: 5px 5px 10px rgba(0,0,0,.3);
                box-shadow: 5px 5px 10px rgba(0,0,0,.3);
                z-index: 2;
                border-size: 10px;
                -webkit-transform: rotate(-360deg);
                -moz-transform: rotate(-360deg);
                -o-transform: rotate(-360deg);
                transform: rotate(-360deg);
            }

        a.red {
            background-color: rgba(239,57,50,1);
            color: rgba(133,32,28,1);
            border-color: rgba(133,32,28,.2);
        }

            a.red:hover {
                color: rgba(239,57,50,1);
            }

        a.purple {
            color: rgba(203,96,179,1);
        }

            a.purple:hover {
                color: rgba(252,236,252,1);
            }

        a.green {
            background-color: rgb(10, 41, 114);
            color: rgb(255, 255, 255);
            border-color: rgb(255, 255, 255);
        }

            a.green:hover {
                color: rgb(255, 255, 255);
            }

        a.yellow {
            background-color: rgba(252,227,1,1);
            color: rgba(153,38,0,1);
            border-color: rgba(153,38,0,.2);
        }

            a.yellow:hover {
                color: rgba(252,227,1,1);
            }

        .round span.round {
            display: block;
            opacity: 0;
            -webkit-transition: all .5s ease-in-out;
            -moz-transition: all .5s ease-in-out;
            -o-transition: all .5s ease-in-out;
            transition: all .5s ease-in-out;
            font-size: 1px;
            border: none;
            padding: 40% 20% 0 20%;
            color: #fff;
        }

        .round span:hover {
            opacity: .85;
            font-size: 16px;
            -webkit-text-shadow: 0 1px 1px rgba(0,0,0,.5);
            -moz-text-shadow: 0 1px 1px rgba(0,0,0,.5);
            -o-text-shadow: 0 1px 1px rgba(0,0,0,.5);
            text-shadow: 0 1px 1px rgba(0,0,0,.5);
        }

        .green span {
            background: rgba(0,63,71,.7);
        }

        .purple spam {
            background: rgba(128,96,179,.7);
        }

        .red span {
            background: rgba(133,32,28,.7);
        }

        .yellow span {
            background: rgba(161,145,0,.7);
        }

        .auto-style9 {
            height: 18px;
        }

        .auto-style10 {
            width: 100%;
            height: 95px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">




    <table class="auto-style10">
        <tr>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
        </tr>
        <tr>
            <td>
                <li><a href="Ingreso.aspx" class="round green">1<br>Ingreso</br>
                    <span class="round">Ingreso nuevo Colaborador.</span></a></li>
            </td>
            <td>
                <li><a href="Evaluaciones.aspx" class="round green">2<br>Evaluación Psicolaboral</br>
                    <span class="round">Evaluación Psicolaboral. </span></a></li>
            </td>
            <td>
                <li><a href="menu-tecnico.aspx" class="round green">3<br>Evaluación Técnica</br>
                    <span class="round">Evaluaciones de Geosintéticos y Maquinarias. </span></a></li>
            </td>
            <td>
                <li><a href="menuinforme.aspx" class="round green">4<br>Reportes</br>
                    <span class="round">Consulta Reportes. </span></a></li>
            </td>
            <td>
                <li><a href="Buscar.aspx" class="round green">5<br>Buscar</br>
                    <span class="round">Búsqueda de Candidatos. </span></a></li>
            </td>
        </tr>
        <tr>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
            <td class="auto-style9">
                <img src="Imagenes/blanco.png" /></td>
        </tr>
    </table>




</asp:Content>
