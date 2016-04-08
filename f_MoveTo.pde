void moveTo(PVector position)
{
  float xDif = position.x - gob.pos.x;
  float yDif = gob.pos.y - position.y;
  gob.theta = radians((atan2(xDif, yDif) * 180 / PI));
}