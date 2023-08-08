<script setup>
import Accent from "./components/Accent.vue"
import Tool from "./components/Tool.vue"
</script>

<template>
	<header style="text-align: center">
		<img
			alt="Profile picture"
			class="logo"
			src="./assets/shapes/4ik_v.png"
			width="125"
			height="125"
		/>
		<div class="wrapper">
			<h1>geometric · jiyo · yap</h1>
		</div>
	</header>

	<main>
		<div id="intro" class="tb">
			<p id="shortintro">
				hi there! i’m <Accent field="name" text="darren" />, or
				<Accent field="pseudonym" text="geometric" />. my pronouns are
				<Accent field="pronouns" text="he/him" />.
			</p>

			<p id="longintro">
				i’m a <Accent field="profession" text="high school student" /> that
				dabbles in a range of hobbies, including
				<Accent field="hb1" text="programming" />,
				<Accent field="hb2" text="language creation" />, and
				<Accent field="hb3" text="classical music" />.
			</p>
		</div>

		<div id="hobbies" class="tb">
			<p id="prog">
				i'm a member of my school's <Accent field="cca" text="infocomm club" />,
				and i've picked up some skills including
				<Accent field="sk1" text="basic competitive programming" /> in
				<Tool field="c++" text="c++" /> and
				<Accent field="sk2" text="data science" /> with
				<Tool field="py" text="python" />.
			</p>

			<p id="prog_web">
				i also have some experience with
				<Accent field="web" text="languages of the web" />, including
				<Tool field="basicweb" text="html/css/javascript" />,
				<Tool field="vue" text="vue" /> and <Tool field="react" text="react" />.
			</p>

			<p id="prog_linux">
				in addition, i’ve integrated various
				<Accent field="linux" text="gnu/linux" /> distributions into my
				workflow, and am somewhat familiar with
				<Accent field="sh" text="shell scripting" />.
			</p>
		</div>

		<div id="mus" class="tb">
			<p id="music">
				i enjoy <Accent field="classical" text="classical music" />, and play
				the <Tool field="pno" text="piano" />. i also
				<Accent field="comp" text="compose some original pieces" /> for a
				variety of instrument combinations, such as
				<Tool field="strorch" text="string orchestra" />,
				<Tool field="pnosol" text="solo piano" /> and
				<Tool field="strquart" text="string quartet" />.
			</p>
		</div>

		<div id="lng" class="tb">
			<p id="lang">
				i love <Accent field="ling" text="languages and linguistics" /> too! i
				speak <Tool field="eng" text="english" /> and
				<Tool field="mando" text="mandarin chinese" /> natively. i am learning
				<Tool field="malay" text="bahasa melayu" /> in school as an third
				language, and am a member of the
				<a href="https://vikoli.org">viȏssa</a> community <i>(bite lera)</i>. i
				also
				<a
					href="https://geo-at-school.notion.site/constructed-languages-39bcdff82dc54c8787813b1a27ce9f3d?pvs=4"
					>construct languages</a
				>
				as a pastime!
			</p>
		</div>
	</main>
</template>

<style scoped>
header {
	line-height: 1.5;
}

.logo {
	display: block;
	margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
	header {
		display: flex;
		place-items: center;
		padding-right: calc(var(--section-gap) / 2);
	}

	.logo {
		margin: 0 2rem 0 0;
	}

	header .wrapper {
		display: flex;
		place-items: flex-start;
		flex-wrap: wrap;
	}
}
</style>
