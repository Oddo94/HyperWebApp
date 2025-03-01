package com.example.hyperwebapp

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.runApplication
import org.springframework.stereotype.Controller
import org.springframework.ui.Model
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RequestParam

@SpringBootApplication
class HyperAppApplication

fun main(args: Array<String>) {
	runApplication<HyperAppApplication>(*args)
}

@Controller
class WebController {

	@GetMapping("/")
	fun homePage(
		@RequestParam(name = "name", defaultValue = "Docker Enthusiast") name: String,
		model: Model
	): String {
		model.addAttribute("name", name)
		return "index"
	}
}
