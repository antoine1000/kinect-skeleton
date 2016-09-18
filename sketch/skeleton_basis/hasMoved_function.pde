// ----- HAS MOVED FUNCTION -----
// *** Allow us to draw the skeleton only when users are moving ***
// *** Otherwise, skeleton stay on screen even when users are off screen ***

boolean hasMoved(userID) {
  intVector currentPos = pos(userID);
  intVector pPos = p_positions.get(userID);
  return (currentPos == pPos);
}
