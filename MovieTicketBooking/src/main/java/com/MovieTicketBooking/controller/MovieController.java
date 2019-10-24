package com.MovieTicketBooking.controller;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.MovieTicketBooking.model.Movie;
import com.MovieTicketBooking.repository.MovieRepository;

@RestController
@SessionAttributes({"Username","userId"})
public class MovieController 
{
	@Autowired
	MovieRepository movieRepository;

	@GetMapping("/AddMovie")
	public ModelAndView showAddMoviePage() 
	{
		Movie movieObj = new Movie();
		ModelAndView addMovie = new ModelAndView("AddMovie");
		addMovie.addObject(movieObj);
		return addMovie;
	}

	@PostMapping("/AddMovie")
	public ModelAndView addMovie(@RequestParam("name") String name,@RequestParam("cast") String cast,@RequestParam("releaseDate") Date releaseDate, @RequestParam("imageName") MultipartFile[] imageName) 
	{
		String path = null;
		String imgName = null;
		try 
		{

			for (MultipartFile file2 : imageName)
			{
				path = "D:\\\\Ram-CD\\\\CD-Work\\\\Ramkumar\\\\MovieTicketBooking\\\\src\\\\main\\\\webapp\\\\WEB-INF\\\\MovieImages\\"+ file2.getOriginalFilename();
				Path uploadPath = Paths.get(path);
				imgName = file2.getOriginalFilename();
				Files.write(uploadPath, file2.getBytes());
			}
		}
		catch (IOException e) 
		{
			e.printStackTrace();
		}
		System.out.println(path);
		
		Movie movie=new Movie();
		movie.setName(name);
		movie.setCast(cast);
		movie.setReleaseDate(releaseDate);
		movie.setImageName(imgName);
		
		movieRepository.save(movie);
		
		return new ModelAndView("redirect:/ListMovies");
	}

	@GetMapping("/UserHome")
	public ModelAndView listMovies(ModelAndView model) 
	{
		List<Movie> movies = new ArrayList<Movie>();
		movies = (List<Movie>) movieRepository.findAll();
		model.addObject("movies", movies);
		model.setViewName("UserHome");
		return model;
	}
	
	@PostMapping("/ListMovies")
	public ModelAndView listMovie(ModelAndView model)
	{
		List<Movie> movies = new ArrayList<Movie>();
		movies = (List<Movie>) movieRepository.findAll();
		model.addObject("movies", movies);
		model.setViewName("Home");
		return model;
	}
	
	@GetMapping("/ListMovies")
	public ModelAndView listMovieAdmin(ModelAndView model)
	{
		List<Movie> movies = new ArrayList<Movie>();
		movies = (List<Movie>) movieRepository.findAll();
		model.addObject("movies", movies);
		model.setViewName("Home");
		return model;
	}
}
