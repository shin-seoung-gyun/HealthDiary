<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html :class="{ 'theme-dark': dark }" x-data="data()" lang="en">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Exercise Diary</title>
<link
	href="https://fonts.googleapis.com/css2?family=Inter:wght@400;500;600;700;800&display=swap"
	rel="stylesheet" />
<link rel="stylesheet"
	href="resourses/public/assets/css/tailwind.output.css" />
<script
	src="https://cdn.jsdelivr.net/gh/alpinejs/alpine@v2.x.x/dist/alpine.min.js"
	defer></script>
<script src="resourses/public/assets/js/init-alpine.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.css" />
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.9.3/Chart.min.js"
	defer></script>
<script src="resourses/public/assets/js/charts-lines.js" defer></script>
<script src="resourses/public/assets/js/charts-pie.js" defer></script>
</head>
<body>
	<div class="flex h-screen bg-gray-50 dark:bg-gray-900"
		:class="{ 'overflow-hidden': isSideMenuOpen }">
		<!-- Desktop sidebar -->
		<aside
			class="z-20 hidden w-64 overflow-y-auto bg-white dark:bg-gray-800 md:block flex-shrink-0">
			<div class="py-4 text-gray-500 dark:text-gray-400">
				<a class="ml-6 text-lg font-bold text-gray-800 dark:text-gray-200"
					href="main.do"> EXERCISE DIARY </a>
				<ul class="mt-6">
					<li class="relative px-6 py-3"><span
						class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
						aria-hidden="true"></span> <a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="main.do"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">메인 페이지</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="diary.do"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">일기 작성</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="findexercise.do"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg> <span class="ml-4">유사운동, 운동법찾기</span>
					</a></li>
					<!--             <li class="relative px-6 py-3"> -->
					<!--               <a -->
					<!--                 class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" -->
					<!--                 href="charts.html" -->
					<!--               > -->
					<!--                 <svg -->
					<!--                   class="w-5 h-5" -->
					<!--                   aria-hidden="true" -->
					<!--                   fill="none" -->
					<!--                   stroke-linecap="round" -->
					<!--                   stroke-linejoin="round" -->
					<!--                   stroke-width="2" -->
					<!--                   viewBox="0 0 24 24" -->
					<!--                   stroke="currentColor" -->
					<!--                 > -->
					<!--                   <path -->
					<!--                     d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z" -->
					<!--                   ></path> -->
					<!--                   <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path> -->
					<!--                 </svg> -->
					<!--                 <span class="ml-4">운동 통계</span> -->
					<!--               </a> -->
					<!--             </li> -->
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
					<li class="relative px-6 py-3"><span
						class="absolute inset-y-0 left-0 w-1 bg-purple-600 rounded-tr-lg rounded-br-lg"
						aria-hidden="true"></span> <a
						class="inline-flex items-center w-full text-sm font-semibold text-gray-800 transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200 dark:text-gray-100"
						href="index.html"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M3 12l2-2m0 0l7-7 7 7M5 10v10a1 1 0 001 1h3m10-11l2 2m-2-2v10a1 1 0 01-1 1h-3m-6 0a1 1 0 001-1v-4a1 1 0 011-1h2a1 1 0 011 1v4a1 1 0 001 1m-6 0h6"></path>
                </svg> <span class="ml-4">메인 페이지</span>
					</a></li>
				</ul>
				<ul>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="diary.do"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M9 5H7a2 2 0 00-2 2v12a2 2 0 002 2h10a2 2 0 002-2V7a2 2 0 00-2-2h-2M9 5a2 2 0 002 2h2a2 2 0 002-2M9 5a2 2 0 012-2h2a2 2 0 012 2m-3 7h3m-3 4h3m-6-4h.01M9 16h.01"></path>
                </svg> <span class="ml-4">일기 작성</span>
					</a></li>
					<li class="relative px-6 py-3"><a
						class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200"
						href="cards.html"> <svg class="w-5 h-5"
								aria-hidden="true" fill="none" stroke-linecap="round"
								stroke-linejoin="round" stroke-width="2" viewBox="0 0 24 24"
								stroke="currentColor">
                  <path
									d="M19 11H5m14 0a2 2 0 012 2v6a2 2 0 01-2 2H5a2 2 0 01-2-2v-6a2 2 0 012-2m14 0V9a2 2 0 00-2-2M5 11V9a2 2 0 012-2m0 0V5a2 2 0 012-2h6a2 2 0 012 2v2M7 7h10"></path>
                </svg> <span class="ml-4">유사운동, 운동법찾기</span>
					</a></li>
					<!--             <li class="relative px-6 py-3"> -->
					<!--               <a -->
					<!--                 class="inline-flex items-center w-full text-sm font-semibold transition-colors duration-150 hover:text-gray-800 dark:hover:text-gray-200" -->
					<!--                 href="charts.html" -->
					<!--               > -->
					<!--                 <svg -->
					<!--                   class="w-5 h-5" -->
					<!--                   aria-hidden="true" -->
					<!--                   fill="none" -->
					<!--                   stroke-linecap="round" -->
					<!--                   stroke-linejoin="round" -->
					<!--                   stroke-width="2" -->
					<!--                   viewBox="0 0 24 24" -->
					<!--                   stroke="currentColor" -->
					<!--                 > -->
					<!--                   <path -->
					<!--                     d="M11 3.055A9.001 9.001 0 1020.945 13H11V3.055z" -->
					<!--                   ></path> -->
					<!--                   <path d="M20.488 9H15V3.512A9.025 9.025 0 0120.488 9z"></path> -->
					<!--                 </svg> -->
					<!--                 <span class="ml-4">운동 통계</span> -->
					<!--               </a> -->
					<!--             </li> -->
				</ul>
			</div>
		</aside>
		<div class="flex flex-col flex-1 w-full">

			<main class="h-full overflow-y-auto">
				<div class="container px-6 mx-auto grid">
					<h2
						class="my-6 text-2xl font-semibold text-gray-700 dark:text-gray-200">
						<a href="main.do">EXERCISE DIARY</a>
					</h2>
					<!-- CTA -->
					<a
						class="flex items-center justify-between p-4 mb-8 text-sm font-semibold text-purple-100 bg-purple-600 rounded-lg shadow-md focus:outline-none focus:shadow-outline-purple"
						href="findexercise.do">
						<div class="flex items-center">
							<svg class="w-5 h-5 mr-2" fill="currentColor" viewBox="0 0 20 20">
                  <path
									d="M9.049 2.927c.3-.921 1.603-.921 1.902 0l1.07 3.292a1 1 0 00.95.69h3.462c.969 0 1.371 1.24.588 1.81l-2.8 2.034a1 1 0 00-.364 1.118l1.07 3.292c.3.921-.755 1.688-1.54 1.118l-2.8-2.034a1 1 0 00-1.175 0l-2.8 2.034c-.784.57-1.838-.197-1.539-1.118l1.07-3.292a1 1 0 00-.364-1.118L2.98 8.72c-.783-.57-.38-1.81.588-1.81h3.461a1 1 0 00.951-.69l1.07-3.292z"></path>
                </svg>
							<span>운동 전 운동정보를 확인하세요!!!</span>
						</div> <span>View more &RightArrow;</span>
					</a>
					<!-- Cards -->
					<div class="grid gap-6 mb-8 md:grid-cols-2 xl:grid-cols-4">
						<!-- Card -->
						<div
							class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
							<div
								class="p-3 mr-4 text-orange-500 bg-orange-100 rounded-full dark:text-orange-100 dark:bg-orange-500">
								<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
										d="M13 6a3 3 0 11-6 0 3 3 0 016 0zM18 8a2 2 0 11-4 0 2 2 0 014 0zM14 15a4 4 0 00-8 0v3h8v-3zM6 8a2 2 0 11-4 0 2 2 0 014 0zM16 18v-3a5.972 5.972 0 00-.75-2.906A3.005 3.005 0 0119 15v3h-3zM4.75 12.094A5.973 5.973 0 004 15v3H1v-3a3 3 0 013.75-2.906z"></path>
                  </svg>
							</div>
							<div>
								<p
									class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
									총 운동 볼륨</p>
								<p
									class="text-lg font-semibold text-gray-700 dark:text-gray-200">
									${extotal.exerciseTotal}</p>
							</div>
						</div>
						<!-- Card -->
						<div
							class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
							<div
								class="p-3 mr-4 text-green-500 bg-green-100 rounded-full dark:text-green-100 dark:bg-green-500">
								<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
										d="M4 4a2 2 0 00-2 2v4a2 2 0 002 2V6h10a2 2 0 00-2-2H4zm2 6a2 2 0 012-2h8a2 2 0 012 2v4a2 2 0 01-2 2H8a2 2 0 01-2-2v-4zm6 4a2 2 0 100-4 2 2 0 000 4z"
										clip-rule="evenodd"></path>
                  </svg>
							</div>
							<div>
								<p
									class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
									일기 개수</p>
								<p
									class="text-lg font-semibold text-gray-700 dark:text-gray-200">
									${total.total} 개</p>
							</div>
						</div>
						<!-- Card -->
						<div
							class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
							<div
								class="p-3 mr-4 text-blue-500 bg-blue-100 rounded-full dark:text-blue-100 dark:bg-blue-500">
								<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path
										d="M3 1a1 1 0 000 2h1.22l.305 1.222a.997.997 0 00.01.042l1.358 5.43-.893.892C3.74 11.846 4.632 14 6.414 14H15a1 1 0 000-2H6.414l1-1H14a1 1 0 00.894-.553l3-6A1 1 0 0017 3H6.28l-.31-1.243A1 1 0 005 1H3zM16 16.5a1.5 1.5 0 11-3 0 1.5 1.5 0 013 0zM6.5 18a1.5 1.5 0 100-3 1.5 1.5 0 000 3z"></path>
                  </svg>
							</div>
							<div>
								<p
									class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
									유사 운동, 운동법 찾기</p>
								<p
									class="text-lg font-semibold text-gray-700 dark:text-gray-200">
									<a href="findexercise.do">바로가기</a>
								</p>
							</div>
						</div>
						<!-- Card -->
						<div
							class="flex items-center p-4 bg-white rounded-lg shadow-xs dark:bg-gray-800">
							<div
								class="p-3 mr-4 text-teal-500 bg-teal-100 rounded-full dark:text-teal-100 dark:bg-teal-500">
								<svg class="w-5 h-5" fill="currentColor" viewBox="0 0 20 20">
                    <path fill-rule="evenodd"
										d="M18 5v8a2 2 0 01-2 2h-5l-5 4v-4H4a2 2 0 01-2-2V5a2 2 0 012-2h12a2 2 0 012 2zM7 8H5v2h2V8zm2 0h2v2H9V8zm6 0h-2v2h2V8z"
										clip-rule="evenodd"></path>
                  </svg>
							</div>
							<div>
								<p
									class="mb-2 text-sm font-medium text-gray-600 dark:text-gray-400">
									일기 작성</p>
								<p
									class="text-lg font-semibold text-gray-700 dark:text-gray-200">
									<a href="diary.do">바로가기</a>
								</p>
							</div>
						</div>
					</div>

					<!-- New Table -->
					<div class="w-full overflow-hidden rounded-lg shadow-xs">
						<div class="w-full overflow-x-auto">


							<table class="w-full whitespace-no-wrap">
								<thead>
									<tr
										class="text-xs font-semibold tracking-wide text-left text-gray-500 uppercase border-b dark:border-gray-700 bg-gray-50 dark:text-gray-400 dark:bg-gray-800">
										<th class="px-4 py-3">번호</th>
										<th class="px-4 py-3">Title</th>
										<th class="px-4 py-3">운동컨디션</th>
										<th class="px-4 py-3">작성일</th>
									</tr>
								</thead>
								<tbody
									class="bg-white divide-y dark:divide-gray-700 dark:bg-gray-800">

									<c:forEach items="${list}" var="temp">
										<tr class="text-gray-700 dark:text-gray-400">
											<td class="px-4 py-3">
												<div class="flex items-center text-sm">
													<div>
														<p class="font-semibold">${ temp.getNo() }</p>
													</div>
												</div>
											</td>
											<td class="px-4 py-3">
												<div class="flex items-center text-sm">
													<!-- Avatar with inset shadow -->
													<div>
														<p class="font-semibold">
															<a href="search.do?no=${ temp.getNo() }"> ${ temp.getTitle() }
															</a>
														</p>
													</div>
												</div>
											</td>
											<td class="px-4 py-3 text-xs"><span
												class="px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100">
													${temp.getConditions()} </span></td>
											<td class="px-4 py-3 text-sm"><fmt:parseDate
													value="${temp.getDate()}" pattern="yyyy-MM-dd HH:mm:ss"
													var="date" /> <fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss"
													value='${date}' /></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
						</div>
						<div
							class="grid px-4 py-3 text-xs font-semibold tracking-wide text-gray-500 uppercase border-t dark:border-gray-700 bg-gray-50 sm:grid-cols-9 dark:text-gray-400 dark:bg-gray-800">
							<span class="flex items-center col-span-3"> Showing
								${(page.page-1)*10+1}-${(page.page-1)*10+10} of ${total.total} </span>
							<span class="col-span-2"></span>
							<!-- Pagination -->
							<span class="flex col-span-4 mt-2 sm:mt-auto sm:justify-end">
								<nav aria-label="Table navigation">
									<ul class="inline-flex items-center">
										<li>
											<button
												class="px-3 py-1 rounded-md rounded-l-lg focus:outline-none focus:shadow-outline-purple"
												aria-label="Previous">
												<c:if test="${page.prev }">
													<a href="main.do?page=${(page.startPage)-1}"><svg
															aria-hidden="true" class="w-4 h-4 fill-current"
															viewBox="0 0 20 20">
                            <path
																d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
																clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg> </a>
												</c:if>
												<c:if test="${!page.prev }">
													<svg aria-hidden="true" class="w-4 h-4 fill-current"
														viewBox="0 0 20 20">
                            <path
															d="M12.707 5.293a1 1 0 010 1.414L9.414 10l3.293 3.293a1 1 0 01-1.414 1.414l-4-4a1 1 0 010-1.414l4-4a1 1 0 011.414 0z"
															clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>
												</c:if>
											</button>
										</li>

										<c:forEach begin="${page.startPage }" end="${page.endPage }"
											var="num">
											<c:if test="${page.page != num }">
												<li><a href="main.do?page=${num}">
														<button
															class="px-3 py-1 rounded-md focus:outline-none focus:shadow-outline-purple">
															${num}</button>
												</a></li>
											</c:if>
											<c:if test="${page.page == num }">
												<li>
													<button
														class="px-3 py-1 text-white transition-colors duration-150 bg-purple-600 border border-r-0 border-purple-600 rounded-md focus:outline-none focus:shadow-outline-purple">
														${num}</button>
												</li>
											</c:if>
										</c:forEach>

										<li>
											<button
												class="px-3 py-1 rounded-md rounded-r-lg focus:outline-none focus:shadow-outline-purple"
												aria-label="Next">
												<c:if test="${page.next }">
													<a href="main.do?page=${(page.endPage)+1}"> <svg
															class="w-4 h-4 fill-current" aria-hidden="true"
															viewBox="0 0 20 20">
                          
                            <path
																d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
																clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>
													</a>
												</c:if>

												<c:if test="${!page.next }">
													<svg class="w-4 h-4 fill-current" aria-hidden="true"
														viewBox="0 0 20 20">
                          
                            <path
															d="M7.293 14.707a1 1 0 010-1.414L10.586 10 7.293 6.707a1 1 0 011.414-1.414l4 4a1 1 0 010 1.414l-4 4a1 1 0 01-1.414 0z"
															clip-rule="evenodd" fill-rule="evenodd"></path>
                          </svg>

												</c:if>

											</button>
										</li>
									</ul>
								</nav>
							</span>
						</div>
					</div>
				</div>
			</main>
		</div>
	</div>
</body>
</html>
