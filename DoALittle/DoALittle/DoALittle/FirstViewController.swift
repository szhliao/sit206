//
//  FirstViewController.swift
//  DoALittle
//
//  Created by xin on 22/5/17.
//  Copyright © 2017 Scott. All rights reserved.
//

import UIKit
//for GPS tools
import MapKit
//for music tools
import AVFoundation

//global variables
//default array of list for items in table
var list = ["Submit Work Report","Pick Up Kids","Pay Bills","Go to Bank"]

//added UITableViewDelegate and UITableViewDatasource
class FirstViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {



    //initialise table view
    //delegated and datasourced
    @IBOutlet var dalTableView: UITableView!
    
    //define functions to populate table view with list
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    
    //define number of rows in table view
    {
        //will define row number as number of items in list
        return (list.count)
    }
    
    //define function to populate table view with text
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
        
    
    {
        //define cell using prototype cell defined in table view attributes
        let cell = UITableViewCell(style: UITableViewCellStyle.default, reuseIdentifier: "DALcell")
        
        //checks items in list array
        cell.textLabel?.text = list[indexPath.row]
        
        //returns items to cell as required by function
        return(cell)
    }
    
    //define function to reveal delete with swipe left
    //standard iOS pattern
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath)
        
    {
        //if user input delete
        if editingStyle == UITableViewCellEditingStyle.delete
        {
            //delete indexed/selected row
            list.remove(at: indexPath.row)
            //update table
            dalTableView.reloadData()
        }
    }
    
    //define function to refresh table in VC 1
    //everytime VC 1 is accessed
    override func viewDidAppear(_ animated: Bool)
    {
        dalTableView.reloadData()
    }
    
    
    //define function to open GPS
    @IBAction func openGps(_ sender: Any)
    
    {
        //define default destination
        let lati:CLLocationDegrees = -37.841225
        let longi:CLLocationDegrees = 145.110288
        
        let regionDistance:CLLocationDistance = 1000;
        let coordinates = CLLocationCoordinate2DMake(lati, longi)
        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
        
        //setting appearance of map and nav and zoom
        let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)]
        
        //set placemarker
        let placemark = MKPlacemark(coordinate:coordinates)
        let mapItem = MKMapItem(placemark: placemark)
        mapItem.name = "Deakin Uni"
        //apply options defined above when launching
        mapItem.openInMaps(launchOptions: options)
    }
    
    
    //define name change function
    
    
    @IBOutlet var textField: UITextView!
    @IBAction func nameChange(_ sender: Any)
    
    {
        
        //create alert
        let alert = UIAlertController(title: "Change Name", message: "Who is owner of this To-Do-List?", preferredStyle: .alert)
        
        //placeholder value
        alert.addTextField { (textField) in
            textField.text = "Type your name here"
        }
        //get value from user input
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: { [weak alert] (_) in
            let tField = alert?.textFields![0]
            print("Text field: \(tField?.text)")
            self.textField.text = tField?.text
        }))
        
         let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { (_) in }
        alert.addAction(cancelAction)
        //present alert
        self.present(alert, animated: true, completion: nil)
    }
    
    //music player code
    //define an AVAudioPlayer as audioPlayer
    
    var audioPlayer = AVAudioPlayer()
    
    //define buttons
    //play button
    @IBAction func Play(_ sender: Any) {
        audioPlayer.play()
    }
    
    //pause button
    @IBAction func Pause(_ sender: Any) {
        if audioPlayer.isPlaying{
            //pause audioPlayer at time
            audioPlayer.pause()
            
            
        }
        else {
            
        }
        
    }
    //restart button
    @IBAction func Restart(_ sender: Any) {
        if audioPlayer.isPlaying{
            //sets audioPlayer to 0 time in track
            audioPlayer.currentTime = 0
            //plays audioPlayer simulating restart
            audioPlayer.play()
            
        }
        else{
            //sets audioPlayer to 0 time in track
            audioPlayer.currentTime = 0
            //also replays if song is not playing
            audioPlayer.play()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        //using throw value requires do try and catch as below
        do {
        //targets Puzzle-Dreams in apps bundle
            audioPlayer = try AVAudioPlayer(contentsOf: URL.init(fileURLWithPath:Bundle.main.path(forResource: "Puzzle-Dreams", ofType: "mp3")!))
            //run AVAudioplayer func
            audioPlayer.prepareToPlay()
        }
        //catch errors and print
        catch
        {
            print(error)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

