package com.example.springmaven;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.boot.nestest.NesTestService;

@RestController
public class HelloController {

  private final NesTestService nesTestService = new NesTestService();

  @GetMapping("/")
  public String index() {
//     return "It's Alive! V14";
//     return nesTestService.getNesTestSuccess();
    return nesTestService.getSpringBootVersion();
  }

}
