//
//  ViewController.swift
//  youtube-onedaybuild
//
//  Created by Aizhan Tolebayeva on 19.12.2020.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, ModelDelegate {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var model = Model()
    var videos = [Video]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        model.getVideos()
        
        //set itself as the datasource and delegate
        tableView.dataSource = self
        tableView.delegate = self
        
        //set itself as the model delegate
        model.delegate = self
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //confirm that a video was selected
        guard tableView.indexPathForSelectedRow != nil else {
            return
        }
        
        //get a rfernce to the video that was tapped on
        let selectedVideo = videos[tableView.indexPathForSelectedRow!.row]
        
        //get a reference to the detail view controller
        let detailVC = segue.destination as! DetailViewController
        
        //set the videp property of the detail view controller
        detailVC.video = selectedVideo
    }
    
    //MARK: Model Delegate Methods
    
    func videosFetched(_ videos: [Video]) {
        
        //set the returned videos to our video property
        self.videos = videos
        
        //refresh the table view
        tableView.reloadData()
    }
    
    //MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.VIDEOCELL_ID, for: indexPath) as! VideoTableViewCell
        
        //configure the cell with data
        
        //get the title for the video in question
        let video = self.videos[indexPath.row]
        cell.setCell(video)
        
        //return the cell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }


}

