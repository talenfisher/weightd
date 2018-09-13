class Assignment {
    public string name;
    public string weight;
    public double pointsPossible;
    public double pointsReceived;

    this(string name, double pointsReceived, double pointsPossible, string weight) {
        this.name = name;
        this.weight = weight;
        this.pointsPossible = pointsPossible;
        this.pointsReceived = pointsReceived;
    }

    @property double grade() {
        return pointsReceived / pointsPossible;
    }
}