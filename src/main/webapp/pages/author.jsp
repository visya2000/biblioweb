<%@ page import="verbitskiy.DTO.User" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ru">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <title>${author.getName()}</title>
    <meta property="og:type" content="article">
    <meta property="og:title" content="${author.getName()}">


	<link rel="stylesheet" type="text/css" href="<c:url value="/res/assets/css/book.css"/>"/>"/>


    <link rel="apple-touch-icon" sizes="180x180" href="<c:url value="/res/assets/img/icon.png"/>">
    <link rel="icon" type="image/png" sizes="32x32" href="<c:url value="/res/assets/img/icon.png"/>">
    <link rel="icon" type="image/png" sizes="16x16" href="<c:url value="/res/assets/img/icon.png"/>">
    <link rel="mask-icon" href="<c:url value="/res/assets/img/icon.png"/>" color="#ef6201">
    <meta name="msapplication-TileColor" content="#ef6201">
    <meta name="theme-color" content="#ffffff">

</head>
<body>
<div>
    <svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink"
         style="position: absolute; width: 0; height: 0;" width="0" height="0" version="1.1">
        <defs>
            <symbol id="icon-right" viewBox="0 0 1638 1024">
                <title>right</title>
                <path class="path1"
                      d="M0 460.8h1443.84l-384-389.12 66.56-71.68 512 512-512 512-71.68-71.68 384-389.12h-1438.72v-102.4z"></path>
            </symbol>
            <symbol id="icon-left" viewBox="0 0 1638 1024">
                <title>left</title>
                <path class="path1"
                      d="M1638.4 563.2h-1438.72l384 389.12-71.68 71.68-512-512 512-512 71.68 71.68-384 389.12h1438.72v102.4z"></path>
            </symbol>
            <symbol id="icon-up" viewBox="0 0 640 1024">
                <title>up</title>
                <path class="path1"
                      d="M288 1024v-899.2l-243.2 240-44.8-44.8 320-320 320 320-44.8 44.8-243.2-240v899.2h-64z"></path>
            </symbol>
            <symbol id="icon-likes" viewBox="0 0 1024 1024">
                <title>search</title>
                <path class="path1"
                      d="M307.2 180.706c60.235 0 114.447 72.282 126.494 96.376 18.071 36.141 60.235 60.235 102.4 60.235 0 0 0 0 0 0 42.165 0 84.329-24.094 102.4-60.235 24.094-24.094 78.306-96.376 138.541-96.376 18.071 0 42.165 6.024 72.282 24.094 48.188 36.141 60.235 66.259 60.235 90.353 6.024 132.518-186.729 361.412-361.412 512-174.682-150.588-367.435-373.459-361.412-512-6.024-24.094 0-54.212 54.212-90.353 24.094-18.071 48.188-24.094 66.259-24.094zM777.035 60.235c-144.565 0-234.918 162.635-234.918 162.635s-90.353-162.635-234.918-162.635c-42.165 0-84.329 12.047-138.541 48.188-385.506 259.012 379.482 855.341 379.482 855.341s758.965-596.329 367.435-855.341c-54.212-36.141-96.376-48.188-138.541-48.188v0z"></path>
            </symbol>
            <symbol id="icon-search" viewBox="0 0 1024 1024">
                <title>search</title>
                <path class="path1"
                      d="M1024 986.274l-37.726 37.726-220.968-220.968c-80.842 70.063-188.632 113.179-301.811 113.179-258.695 0-463.495-204.8-463.495-458.105s204.8-458.105 458.105-458.105c253.305 0 458.105 204.8 458.105 458.105 0 118.568-43.116 220.968-113.179 301.811l220.968 226.358zM862.316 458.105c0-220.968-183.242-404.211-404.211-404.211s-404.211 183.242-404.211 404.211c0 220.968 183.242 404.211 404.211 404.211s404.211-183.242 404.211-404.211z"></path>
            </symbol>
            <symbol id="icon-edit" viewBox="0 0 24 24">
                <title>edit</title>
                <path class="path1"
                      d="M18.311 2.828l2.862 2.861-15.033 15.032-3.583.722.723-3.584 15.031-15.031zm0-2.828l-16.873 16.872-1.438 7.127 7.127-1.437 16.874-16.873-5.69-5.689z"></path>
            </symbol>
            <symbol id="icon-cross" viewBox="0 0 1024 1024">
                <title>cross</title>
                <path class="path1"
                      d="M1024 968.862l-55.138 55.138-456.862-456.862-456.862 456.862-55.138-55.138 456.862-456.862-456.862-456.862 55.138-55.138 456.862 456.862 456.862-456.862 55.138 55.138-456.862 456.862 456.862 456.862z"></path>
            </symbol>
            <symbol id="icon-compl" viewBox="0 0 1024 1024">
                <title>compl</title>
                <path class="path1"
                      d="M630.154 283.569l346.585-165.415 39.385 70.892-346.585 165.415-39.385-70.892zM1024 905.846h-86.646c-86.646-141.785-244.185-236.308-425.354-236.308s-330.831 94.523-425.354 236.308h-86.646c94.523-189.046 291.446-315.077 512-315.077s417.477 126.031 512 315.077zM7.877 189.046l39.385-70.892 346.585 157.538-39.385 70.892-346.585-157.538z"></path>
            </symbol>
            <symbol id="icon-meta_cat" viewBox="0 0 1024 1024">
                <title>meta_cat</title>
                <path class="path1"
                      d="M903.529 993.882h-783.059c-66.259 0-120.471-54.212-120.471-120.471v-722.824c0-66.259 54.212-120.471 120.471-120.471h481.882c66.259 0 120.471 54.212 120.471 120.471v60.235h180.706c66.259 0 120.471 54.212 120.471 120.471v542.118c0 66.259-54.212 120.471-120.471 120.471zM963.765 331.294c0-36.141-24.094-60.235-60.235-60.235h-240.941v-120.471c0-36.141-24.094-60.235-60.235-60.235h-481.882c-36.141 0-60.235 24.094-60.235 60.235v259.012c18.071-12.047 36.141-18.071 60.235-18.071h783.059c24.094 0 42.165 6.024 60.235 18.071v-78.306zM963.765 512c0-36.141-24.094-60.235-60.235-60.235h-783.059c-36.141 0-60.235 24.094-60.235 60.235v361.412c0 36.141 24.094 60.235 60.235 60.235h783.059c36.141 0 60.235-24.094 60.235-60.235v-361.412z"></path>
            </symbol>
            <symbol id="icon-meta_coms" viewBox="0 0 1024 1024">
                <title>meta_coms</title>
                <path class="path1"
                      d="M903.529 692.706h-198.776l-301.176 301.176-42.165-42.165 301.176-301.176v-18.071h240.941c36.141 0 60.235-24.094 60.235-60.235v-421.647c0-36.141-24.094-60.235-60.235-60.235h-783.059c-36.141 0-60.235 24.094-60.235 60.235v421.647c0 36.141 24.094 60.235 60.235 60.235h240.941v60.235h-240.941c-66.259 0-120.471-54.212-120.471-120.471v-421.647c0-66.259 54.212-120.471 120.471-120.471h783.059c66.259 0 120.471 54.212 120.471 120.471v421.647c0 66.259-54.212 120.471-120.471 120.471z"></path>
            </symbol>
            <symbol id="icon-meta_date" viewBox="0 0 1024 1024">
                <title>meta_date</title>
                <path class="path1"
                      d="M512 1024c-283.106 0-512-228.894-512-512s228.894-512 512-512c283.106 0 512 228.894 512 512s-228.894 512-512 512zM512 60.235c-246.965 0-451.765 204.8-451.765 451.765s204.8 451.765 451.765 451.765 451.765-204.8 451.765-451.765c0-246.965-204.8-451.765-451.765-451.765zM481.882 240.941h60.235v301.176h-60.235v-301.176z"></path>
            </symbol>
            <symbol id="icon-meta_reply" viewBox="0 0 1024 1024">
                <title>meta_reply</title>
                <path class="path1"
                      d="M519.877 1024l-47.262-47.262 417.477-425.354h-417.477c-259.938 0-472.615-212.677-472.615-472.615v-78.769h78.769v78.769c0 220.554 173.292 393.846 393.846 393.846h417.477l-417.477-425.354 47.262-47.262 504.123 512-504.123 512z"></path>
            </symbol>
            <symbol id="icon-meta_user" viewBox="0 0 992 1024">
                <title>meta_user</title>
                <path class="path1"
                      d="M921.6 1024c-83.2-153.6-243.2-256-422.4-256-185.6 0-345.6 102.4-422.4 256h-76.8c83.2-185.6 275.2-320 492.8-320s409.6 134.4 492.8 320h-64zM492.8 576c-153.6 0-288-128-288-288s134.4-288 288-288c160 0 288 128 288 288s-128 288-288 288zM492.8 64c-121.6 0-224 102.4-224 224s102.4 224 224 224c121.6 0 224-102.4 224-224s-96-224-224-224z"></path>
            </symbol>
            <symbol id="icon-meta_views" viewBox="0 0 1024 1024">
                <title>meta_views</title>
                <path class="path1"
                      d="M512 903.529c-283.106 0-512-174.682-512-391.529s228.894-391.529 512-391.529c283.106 0 512 174.682 512 391.529s-228.894 391.529-512 391.529zM512 180.706c-246.965 0-451.765 150.588-451.765 331.294s204.8 331.294 451.765 331.294 451.765-150.588 451.765-331.294c0-180.706-204.8-331.294-451.765-331.294zM512 722.824c-114.447 0-210.824-96.376-210.824-210.824s96.376-210.824 210.824-210.824c114.447 0 210.824 96.376 210.824 210.824s-96.376 210.824-210.824 210.824zM512 361.412c-84.329 0-150.588 66.259-150.588 150.588s66.259 150.588 150.588 150.588c84.329 0 150.588-66.259 150.588-150.588s-66.259-150.588-150.588-150.588z"></path>
            </symbol>
            <symbol id="icon-search" viewBox="0 0 1024 1024">
                <title>search</title>
                <path class="path1"
                      d="M1024 986.274l-37.726 37.726-220.968-220.968c-80.842 70.063-188.632 113.179-301.811 113.179-258.695 0-463.495-204.8-463.495-458.105s204.8-458.105 458.105-458.105c253.305 0 458.105 204.8 458.105 458.105 0 118.568-43.116 220.968-113.179 301.811l220.968 226.358zM862.316 458.105c0-220.968-183.242-404.211-404.211-404.211s-404.211 183.242-404.211 404.211c0 220.968 183.242 404.211 404.211 404.211s404.211-183.242 404.211-404.211z"></path>
            </symbol>
            <symbol id="icon-vk" viewBox="0 0 868 1024">
                <title>vk</title>
                <path class="path1"
                      d="M807.051 555.39c-43.39-43.39-95.458-69.424-164.881-86.78v0c43.39-17.356 86.78-52.068 112.814-86.78 26.034-43.39 43.39-86.78 43.39-138.847 0-43.39-8.678-86.78-26.034-112.814-17.356-34.712-52.068-60.746-86.78-78.102-43.39-26.034-78.102-34.712-121.492-43.39s-104.136-8.678-182.237-8.678h-381.831v1041.356h433.898c78.102 0 138.847-8.678 182.237-17.356 52.068-17.356 95.458-34.712 130.169-69.424 34.712-26.034 60.746-60.746 78.102-95.458 17.356-43.39 34.712-86.78 34.712-138.847 8.678-69.424-8.678-121.492-52.068-164.881zM503.322 355.797c-8.678 17.356-17.356 26.034-43.39 43.39-17.356 8.678-34.712 8.678-60.746 8.678-17.356 0-52.068 0-95.458 0h-34.712v-216.949h17.356c52.068 0 86.78 0 112.814 0s43.39 8.678 60.746 8.678c17.356 8.678 34.712 17.356 43.39 34.712 8.678 26.034 17.356 43.39 17.356 60.746 0 26.034-8.678 43.39-17.356 60.746zM572.746 781.017c-17.356 26.034-34.712 34.712-60.746 52.068-26.034 8.678-52.068 17.356-78.102 17.356s-78.102 0-147.525 0h-17.356v-260.339h52.068c52.068 0 86.78 0 112.814 0s52.068 0 69.424 8.678c26.034 8.678 52.068 26.034 60.746 43.39 17.356 17.356 17.356 43.39 17.356 78.102 8.678 26.034 0 43.39-8.678 60.746z"></path>
            </symbol>
            <symbol id="icon-ya" viewBox="0 0 486 1024">
                <title>ya</title>
                <path class="path1"
                      d="M473.6 0h-153.6c-153.6 0-281.6 115.2-281.6 339.2 0 134.4 64 236.8 172.8 281.6l-211.2 384c-6.4 12.8 0 19.2 12.8 19.2h96c6.4 0 12.8 0 19.2-6.4l192-371.2h64v371.2c0 0 6.4 6.4 12.8 6.4h83.2c6.4 0 12.8-6.4 12.8-12.8v-998.4c-6.4-6.4-6.4-12.8-19.2-12.8zM384 556.8h-57.6c-89.6 0-179.2-64-179.2-230.4 0-172.8 83.2-243.2 166.4-243.2h70.4v473.6z"></path>
            </symbol>
            <symbol id="icon-fb" viewBox="0 0 683 1024">
                <title>fb</title>
                <path class="path1"
                      d="M443.733 1024v-469.333h204.8l34.133-179.2h-238.933v-119.467c0-51.2 17.067-85.333 119.467-85.333h119.467v-162.133c-25.6 0-93.867-8.533-179.2-8.533-179.2 0-298.667 85.333-298.667 238.933v136.533h-204.8v179.2h204.8v469.333h238.933z"></path>
            </symbol>

            <symbol id="icon-gp" viewBox="0 0 1536 1024">
                <title>gp</title>
                <path class="path1"
                      d="M1399.467 588.8c0 51.2 0 93.867 0 145.067-42.667 0-93.867 0-136.533 0 0-51.2 0-93.867 0-145.067-42.667 0-93.867 0-136.533 0 0-51.2 0-93.867 0-145.067 42.667 0 93.867 0 136.533 0 0-51.2 0-93.867 0-145.067 42.667 0 93.867 0 136.533 0 0 51.2 0 93.867 0 145.067 42.667 0 93.867 0 136.533 0 0 51.2 0 93.867 0 145.067-42.667 0-93.867 0-136.533 0zM307.2 989.867c-187.733-76.8-324.267-290.133-307.2-503.467 0-264.533 238.933-494.933 486.4-486.4 119.467-8.533 230.4 51.2 324.267 128-34.133 42.667-76.8 93.867-119.467 136.533-110.933-85.333-273.067-110.933-384-17.067-162.133 110.933-162.133 384-17.067 512 145.067 145.067 426.667 68.267 469.333-145.067-93.867 0-187.733 0-281.6 0 0-59.733 0-119.467 0-170.667 153.6 0 307.2 0 469.333 0 8.533 136.533-8.533 281.6-85.333 392.533-119.467 179.2-358.4 230.4-554.667 153.6z"></path>
            </symbol>
            <symbol id="icon-od" viewBox="0 0 623 1024">
                <title>od</title>
                <path class="path1"
                      d="M315.733 520.533c145.067 0 264.533-119.467 264.533-256 0-145.067-119.467-256-264.533-256-145.067-8.533-264.533 110.933-264.533 247.467 0 145.067 119.467 264.533 264.533 264.533zM315.733 128c68.267 0 128 59.733 128 128s-59.733 128-128 128c-76.8 0-136.533-51.2-136.533-128s59.733-128 136.533-128zM614.4 546.133c-17.067-25.6-59.733-51.2-110.933-8.533-76.8 59.733-187.733 59.733-187.733 59.733s-119.467 0-196.267-59.733c-51.2-42.667-93.867-17.067-110.933 8.533-25.6 51.2 0 76.8 68.267 119.467 59.733 34.133 136.533 51.2 179.2 51.2l-34.133 42.667c-59.733 59.733-119.467 110.933-153.6 153.6-25.6 25.6-25.6 59.733 0 85.333l8.533 8.533c25.6 25.6 59.733 25.6 85.333 0l153.6-153.6c59.733 59.733 119.467 110.933 153.6 153.6 25.6 25.6 59.733 25.6 85.333 0l8.533-8.533c25.6-25.6 25.6-59.733 0-85.333l-162.133-153.6-34.133-34.133c51.2-8.533 128-17.067 179.2-51.2 68.267-51.2 93.867-76.8 68.267-128z"></path>
            </symbol>
            <symbol id="icon-mail" viewBox="0 0 1007 1024">
                <title>mail</title>
                <path class="path1"
                      d="M485.966 216.949c78.102 0 147.525 34.712 199.593 95.458v0c8.678-34.712 26.034-52.068 43.39-52.068h8.678c34.712 0 43.39 34.712 43.39 43.39v425.22c0 26.034 26.034 43.39 43.39 26.034 60.746-69.424 138.847-355.797-43.39-520.678-164.881-164.881-390.508-138.847-512-52.068-121.492 95.458-208.271 303.729-130.169 494.644 86.78 208.271 329.763 277.695 477.288 208.271 78.102-34.712 112.814 78.102 34.712 112.814-112.814 52.068-442.576 43.39-590.102-234.305-104.136-190.915-95.458-520.678 173.559-685.559 208.271-130.169 485.966-95.458 650.847 86.78 173.559 190.915 164.881 546.712-8.678 685.559-78.102 60.746-190.915 0-190.915-86.78v-26.034c-52.068 52.068-121.492 86.78-199.593 86.78-147.525 0-286.373-147.525-286.373-303.729 0-164.881 138.847-303.729 286.373-303.729v0 0 0zM676.881 503.322c-8.678-121.492-86.78-190.915-190.915-190.915v0c-112.814 8.678-182.237 104.136-182.237 208.271 0 121.492 78.102 199.593 182.237 199.593 112.814 0 190.915-86.78 190.915-190.915v-26.034z"></path>
            </symbol>
            <symbol id="icon-fav" viewBox="0 0 1024 1024">
                <title>fav</title>
                <path class="path1"
                      d="M512 210.489c17.067 28.444 34.133 73.956 56.889 142.222l22.756 79.644h91.022c73.956 0 119.467 5.689 153.6 11.378-22.756 22.756-56.889 56.889-125.156 108.089l-62.578 45.511 22.756 73.956c22.756 73.956 34.133 125.156 39.822 159.289-28.444-17.067-68.267-39.822-125.156-79.644l-73.956-51.2-68.267 51.2c-56.889 45.511-96.711 68.267-125.156 79.644 5.689-34.133 17.067-79.644 39.822-159.289l22.756-73.956-62.578-45.511c-68.267-51.2-102.4-85.333-125.156-108.089 28.444-5.689 73.956-11.378 153.6-11.378h91.022l22.756-79.644c17.067-68.267 39.822-113.778 51.2-142.222zM512 56.889c-56.889 0-108.089 85.333-164.978 261.689 0 0 0 0-5.689 0-352.711 0-381.156 108.089-96.711 324.267-62.578 216.178-56.889 324.267 28.444 324.267 51.2 0 130.844-39.822 238.933-125.156 108.089 85.333 187.733 125.156 238.933 125.156 85.333 0 91.022-108.089 22.756-324.267 284.444-216.178 250.311-324.267-96.711-324.267 0 0 0 0-5.689 0-51.2-176.356-102.4-261.689-159.289-261.689v0z"></path>
            </symbol>
            <symbol id="icon-star" viewBox="0 0 1024 1024">
                <title>star</title>
                <path class="path1"
                      d="M326.4 294.4c-396.8 0-435.2 121.6-115.2 364.8-121.6 396.8-19.2 467.2 300.8 224 320 243.2 422.4 166.4 294.4-224 320-243.2 281.6-364.8-115.2-364.8-115.2-390.4-243.2-390.4-364.8 0z"></path>
            </symbol>
            <symbol id="icon-tw" viewBox="0 0 1195 1024">
                <title>tw</title>
                <path class="path1"
                      d="M1194.667 119.467v0 0zM827.733 0c-136.533 0-247.467 119.467-247.467 256 0 17.067 0 42.667 8.533 59.733-204.8-8.533-384-110.933-503.467-264.533-25.6 34.133-34.133 76.8-34.133 128 0 93.867 42.667 170.667 110.933 213.333-42.667 0-76.8-17.067-110.933-34.133 0 0 0 0 0 0 0 128 85.333 230.4 196.267 256-25.6 8.533-42.667 8.533-68.267 8.533-17.067 0-34.133 0-42.667-8.533 25.6 110.933 119.467 187.733 230.4 187.733-85.333 68.267-187.733 110.933-307.2 110.933-17.067 0-42.667 0-59.733 0 110.933 68.267 238.933 110.933 375.467 110.933 452.267 0 699.733-392.533 699.733-733.867 0-8.533 0-25.6 0-34.133 51.2-34.133 85.333-85.333 119.467-136.533-42.667 17.067-93.867 34.133-136.533 42.667 51.2-34.133 85.333-85.333 110.933-145.067-51.2 25.6-102.4 51.2-153.6 59.733-51.2-42.667-119.467-76.8-187.733-76.8z"></path>
            </symbol>
        </defs>
    </svg>
</div>

<div class="klavva">
    <div class="dfsfsdgtt">
    </div>
    <div class="fasfasgjjj">
        <div style="float: left">
            <div class="contentik">
                <div class="fgttwtyyuu">
                </div>


                <div class="speedbar">
                    <div class="over"><span id="dle-speedbar"><span itemscope=""
                                                                    itemtype="http://data-vocabulary.org/Breadcrumb"><a
                            href="catalog" itemprop="url"><span
                            itemprop="title">Главная</span></a></span> » <span itemscope=""
                                                                               itemtype="http://data-vocabulary.org/Breadcrumb">
                        </span> ${author.getName()}</span>
                    </div>
                </div>


                <div id="dle-content">
                    <article class="fiuurkrk" itemprop="mainEntity" itemscope="" itemtype="http://schema.org/Book">
                        <h1>${author.getName()}
                            <c:if test="${author.getDateOfBirth()!=null}">
                                (${author.getDateOfBirth().getDayOfMonth()}
                                <c:choose>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==1}">
                                         января
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==2}">
                                         февраля
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==3}">
                                         марта
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==4}">
                                         апреля
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==5}">
                                         мая
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==6}">
                                         июня
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==7}">
                                         июля
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==8}">
                                         августа
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==9}">
                                         сентября
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==10}">
                                         октября
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==11}">
                                         ноября
                                    </c:when>
                                    <c:when test="${author.getDateOfBirth().getMonthValue()==12}">
                                         декабря
                                    </c:when>
                                </c:choose>
                                ${author.getDateOfBirth().getYear()} г
                                <c:if test="${author.getDateOfDeath()!=null}">
                                     - ${author.getDateOfDeath().getDayOfMonth()}
                                    <c:choose>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==1}">
                                            января
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==2}">
                                            февраля
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==3}">
                                            марта
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==4}">
                                            апреля
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==5}">
                                            мая
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==6}">
                                            июня
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==7}">
                                            июля
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==8}">
                                            августа
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==9}">
                                            сентября
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==10}">
                                            октября
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==11}">
                                            ноября
                                        </c:when>
                                        <c:when test="${author.getDateOfDeath().getMonthValue()==12}">
                                            декабря
                                        </c:when>
                                    </c:choose>
                                    ${author.getDateOfDeath().getYear()} г</c:if>)
                            </c:if>
                        </h1>

                        <div style="clear: both">
                        </div>
                        <div itemprop="description">
                            ${author.getBiography()}
                        </div>
                        <div style="clear: both">
                        </div>

                        <div class="mnimulaz">
                        </div>


                        <div id="dle-content-author" style="<c:url value="/res/assets/css/catalog.css"/>">
                            <c:forEach items="${author.getBooks()}" var="book">
                                <div class="nerreeee" itemprop="itemListElement" itemscope=""
                                     itemtype="http://www.schema.org/Book">
                                    <meta itemprop="position" content="1">
                                    <a itemprop="url" href="book?book_id=${book.getId()}" class="mnimukkkea">
                                        <div class="dmnnerr">
                                            <div class="mnerddd">
                                                <img itemprop="image" class="lazy loaded" alt="${book.getName()}"
                                                     src="${book.getImageLink()}" data-was-processed="true">


                                                <h3 itemprop="name"><c:out value="${book.getName()}"/></h3>

                                                <div class="ffferrr" itemprop="author">
                                                    <c:out value="${book.getAuthor().getName()}"/>
                                                </div>

                                            </div>
                                        </div>
                                    </a>
                                    <div class="ratinngngss" title="Рейтинг">
                                        <div id="ratig-layer-1830">
                                            <div class="rating">
                                                <ul class="unit-rating">
                                                    <li class="current-rating" style="width: calc(${book.getMark()}*20%)">${book.getMark()}*20</li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="grammer" title="Рейтинг значение">
                                            ${book.getMark()}
                                    </div>
                                </div>
                            </c:forEach>

                        </div>

                        <div class="mnimulaz">
                        </div>
                    </article>
                </div>


            </div>
            <div class="menushka">
                <div class="menushka" itemscope="" itemtype="http://schema.org/WPSideBar">
                    <div class="block_zagolovok" itemprop="name">
                        <svg class="svg-icon" viewBox="0 0 20 20">
                            <path d="M17.35,2.219h-5.934c-0.115,0-0.225,0.045-0.307,0.128l-8.762,8.762c-0.171,0.168-0.171,0.443,0,0.611l5.933,5.934c0.167,0.171,0.443,0.169,0.612,0l8.762-8.763c0.083-0.083,0.128-0.192,0.128-0.307V2.651C17.781,2.414,17.587,2.219,17.35,2.219M16.916,8.405l-8.332,8.332l-5.321-5.321l8.333-8.332h5.32V8.405z M13.891,4.367c-0.957,0-1.729,0.772-1.729,1.729c0,0.957,0.771,1.729,1.729,1.729s1.729-0.772,1.729-1.729C15.619,5.14,14.848,4.367,13.891,4.367 M14.502,6.708c-0.326,0.326-0.896,0.326-1.223,0c-0.338-0.342-0.338-0.882,0-1.224c0.342-0.337,0.881-0.337,1.223,0C14.84,5.826,14.84,6.366,14.502,6.708"></path>
                        </svg>
                        Навигация
                    </div>

                    <div id="cat_menu">
                        <nav class="cat_menu">

                            <ul class="accordion-menu flex-row">

                                <li>
                                    <a href="catalog?genre_id=1"  class="love">
                                        Любовные романы
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=2" class="sf">
                                        Фантастика и фэнтези
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=3" class="adv">
                                        Приключения
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=4" class="det">
                                        Детективы и триллеры
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=5" class="sci">
                                        Наука, Образование
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=7" class="prose">
                                        Проза
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=10" class="religion">
                                        Религия и духовность
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=12" class="antique">
                                        Старинная литература
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=13" class="humor">
                                        Юмор
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=15" class="poetry">
                                        Поэзия, Драматургия
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=18" class="noname8">
                                        Ужасы и мистика
                                    </a>
                                </li>
                                <li>
                                    <a href="catalog?genre_id=19" class="noname10">
                                        Сказки
                                    </a>
                                </li>


                            </ul>
                        </nav>
                    </div>


                </div>
            </div>
        </div>
        <div style="clear: both">
        </div>
    </div>
</div>
<div class="ffgtwetwt">
    <div style="clear: both; ">
    </div>
    <div class="fasfasgjjj">


    </div>
    <div style="clear: both">
    </div>
    <div class="mnnserttat">
        <div id="header">
            <div class="fasfasgjjj">

                <span class="logotype">
                    <a href="catalog">
                        <img src="../res/assets/img/logotype.png" width="200" height="50" alt="" class="mmnshhhtty">
                    </a>

                </span>

                <nav itemscope="" itemtype="http://schema.org/SiteNavigationElement" class="naviga hfghfgtujhgjg">

                    <div class="searchhh">
                        <form id="q_search" action="catalog" method="post">
                            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                            <div class="q_search">
                                <input id="story" name="story" placeholder="Поиск" type="search" value="" class="mySearch">
                                <button class="q_search_btn" type="submit" title="Найти">
                                    <svg class="icon icon-search">
                                        <use xlink:href="#icon-search"></use>
                                    </svg>
                                </button>
                            </div>
                            <input type="hidden" name="do" value="search">
                            <input type="hidden" name="subaction" value="search">
                        </form>
                    </div>
                </nav>

                <% if (session.getAttribute("user") == null) { %>
                <form action="goToLogin">
                    <input type="submit" class="btn login" value="Войти">
                </form>
                <form action="goToReg">
                    <input type="submit" class="btn login" value="Зарегистрироваться">
                </form>
                <% } else { %>
                <form action="myLogout" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" class="btn login" value="Выйти">
                </form>
                <form action="userRoom">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
                    <input type="submit" class="btn login" value="<%=((User) session.getAttribute("user")).getUsername()%>">
                </form>

                <% } %>


            </div>
        </div>
    </div>
    <div style="clear: both">
    </div>
    <div id="footer">
        <div class="myFooter">

            <div class="contacts">
                Контакты:
                email: biblioweb@gmail.com,
                телефон: +375 (17) 290-64-63

            </div>
            <div class="fsdfhjjj">
            </div>
            <a id="upper" href="#top" title="Наверх">
                <svg class="icon icon-up">
                    <use xlink:href="#icon-up"></use>
                </svg>
            </a>

        </div>
        <div style="clear: both">
        </div>
    </div>
</div>
</body>
</html>
