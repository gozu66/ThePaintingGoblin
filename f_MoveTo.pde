void moveTo(PVector position)
{
  float xDif = position.x - gob.pos.x;
  float yDif = gob.pos.y - position.y;
  angle = radians((atan2(xDif, yDif) * 180 / PI));
}

float angle;
PVector moveDir;