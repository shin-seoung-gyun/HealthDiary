<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>일기 상세</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="resourses/public/assets/css/tailwind.output.css" />
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<script src="resourses/public/assets/js/init-alpine.js"></script>
</head>
<body>
	<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
		:class="{ 'overflow-hidden': isSideMenuOpen}">
		<!-- Desktop sidebar -->
		<aside
			class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="main.do"> EXERCISE DIARY </a>
				<ul class="mt-6">
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="main.do"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">메인 페이지</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="diary.do"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">일기 작성</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="findexercise.do"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg> <span class="ml-4">유사운동, 운동법찾기</span>
					</a></li>
<!-- 					<li class="relative px-6 py-3"><a -->
<!-- 						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" -->
<!-- 						href="charts.html"> <svg class="w-5 h-5" aria-hidden="true" -->
<!-- 								fill="none" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"> -->
<!--                   <path -->
<!-- 									d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path> -->
<!--                   <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path> -->
<!--                 </svg> <span class="ml-4">운동 통계</span> -->
<!-- 					</a></li> -->
				</ul>
			</div>
		</aside>
		<!-- Mobile sidebar -->
		<!-- Backdrop -->
		<div x-show="isSideMenuOpen"
			x-transition:enter="transition ease-in-out duration-150"
			x-transition:enter-start="opacity-0"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in-out duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0"
			class="fixed inset-0 z-10 flex items-end bg-black bg-opacity-50 sm:items-center sm:justify-center"></div>
		<aside
			class="fixed inset-y-0 z-20 flex-shrink-0 w-64 mt-16 overflow-y-auto bg-white dark:bg-gray-800 md:hidden"
			x-show="isSideMenuOpen"
			x-transition:enter="transition ease-in-out duration-150"
			x-transition:enter-start="opacity-0 transform -translate-x-20"
			x-transition:enter-end="opacity-100"
			x-transition:leave="transition ease-in-out duration-150"
			x-transition:leave-start="opacity-100"
			x-transition:leave-end="opacity-0 transform -translate-x-20"
			@click.away="closeSideMenu" @keydown.escape="closeSideMenu">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="#"> EXERCISE DIARY </a>
				<ul class="mt-6">
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="index.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">메인 페이지</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="forms.html"> <svg class="w-5 h-5" aria-hidden="true"
								fill="none" stroke-linecap="round" stroke-linejoin="round"
								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">일기 작성</span>
					</a></li>
<!-- 					<li class="relative px-6 py-3"><a -->
<!-- 						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" -->
<!-- 						href="charts.html"> <svg class="w-5 h-5" aria-hidden="true" -->
<!-- 								fill="none" stroke-linecap="round" stroke-linejoin="round" -->
<!-- 								stroke-width="2" viewBox="0 0 24 24" stroke="currentColor"> -->
<!--                   <path -->
<!-- 									d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z"></path> -->
<!--                   <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path> -->
<!--                 </svg> <span class="ml-4">운동 통계</span> -->
<!-- 					</a></li> -->
				</ul>
			</div>
		</aside>
		<div class="flex flex-col flex-1">

			<main class="h-full pb-16 overflow-y-auto">
				<div class="container px-6 mx-auto grid">
					<h2
						class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
						일기 상세</h2>
					<!-- CTA -->
					<!-- General elements -->
					<form action="updatepage.do" method="post">
						<div
							class="px-4 py-3 mb-8 bg-white rounded-lg shadow-md dark:bg-gray-800">
							<label class="block text-sm"> <span
								class="text-gray-700 dark:text-gray-400">일기 제목</span> <input
								class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
								name="title" placeholder="${ list.getTitle() }"
								value="${ list.getTitle() }" readonly />

							</label>

							<div class="mt-4 text-sm">
								<span class="text-gray-700 dark:text-gray-400"> 오늘의 컨디션!!
								</span>
								<div class="mt-2">
									<label class="block text-sm"> <span
										class="text-gray-700 dark:text-gray-400">컨디션</span> <input
										class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
										name="conditions" placeholder="${ list.getConditions() }"
										value="${ list.getConditions() }" readonly />
									</label>

								</div>
							</div>

							<label class="block mt-4 text-sm"> <span
								class="text-gray-700 dark:text-gray-400"> 운동량 </span> <input
								class="block w-full mt-1 text-sm dark:border-gray-600 dark:bg-gray-700 focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:text-gray-300 dark:focus:shadow-outline-gray form-input"
								name="exercisevolume" type="number"
								placeholder="${list.getExerciseVolume() }"
								value="${list.getExerciseVolume() }" />

							</label> <label class="block mt-4 text-sm"> <span
								class="text-gray-700 dark:text-gray-400">일기 내용</span> <textarea
									class="block w-full mt-1 text-sm dark:text-gray-300 dark:border-gray-600 dark:bg-gray-700 form-textarea focus:border-purple-400 focus:outline-none focus:shadow-outline-purple dark:focus:shadow-outline-gray"
									rows="20" name="contents" readonly>${list.getContents() }</textarea>
							</label>

						</div>
						<div>
							<input type="hidden" name="no" value="${ list.getNo() }" />
							<input type="hidden" name="date" value="${list.getDate() }" />
							<div></div>
							<button type="submit"
								class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
								수정</button>
						
							<button type="submit" form="delete"
								class="px-4 py-2 text-sm font-medium leading-5 text-white transition-colors duration-150 bg-purple-600 border border-transparent rounded-lg active:bg-purple-600 hover:bg-purple-700 focus:outline-none focus:shadow-outline-purple">
								삭제</button>
						</div>

					</form>

					<form action="delete.do" id="delete">
						<input type="hidden" name="no" value="${list.getNo()}">
					</form>
			</main>
		</div>

	</div>


</body>
</html>
