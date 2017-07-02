import Foundation

class Point {
    
    /*Attributes*/
    var x : Double
    var y : Double
    
    /*Initialise at (0,0)*/
    init () {
        self.x = 0
        self.y = 0
    }
    
    /*TO DO : initialise with a given position */
    init(_ a : Double, _ b : Double) {
        self.x = a
        self.y = b
    }
    
    
    /*TO DO : moves a point to a new position */
    func moveTo(x xx : Double, y yy : Double) {
        self.x = xx
        self.y = yy
    }
    
    /*TO DO : moves a point x position by dx and y position by dy */
    func moveBy(dx dxx : Double, dy dyy : Double) {
        self.x += dxx
        self.y += dyy
    }
    
    /*TO DO : returns the distance to another point given in parameters*/
    func dist(b bb : Point) -> Double {
        let w = (self.x - bb.x)
        let z = (self.y - bb.y)
        return sqrt(w*w + z*z)
    }
    
    /*TO DO : returns the middle with another point given in parameters*/
    func middle(b bb : Point) -> Point {
        let w = (self.x + bb.x) / 2
        let z = (self.y + bb.y) / 2
        return Point(w, z)
    }
    
}

/*TEST YOUR CODE*/

//1: create a new point with coordinates (4,7)
let p = Point(4,7)

//2: move your point to location (14,7)
p.moveTo(x: 14, y: 7)

//3: move your point by (-10,-7)
p.moveBy(dx: -10, dy: -7)

//4: create a point with coordinates (0,0)
let p2 = Point()

//5: get the distance between your two points
let dist = p.dist(b: p2)

//6: get the middle of your two points
let mid = p.middle(b: p2)

