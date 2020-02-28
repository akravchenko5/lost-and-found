const scrolledDown = () => {
  const objDiv = document.querySelector(".message-window");

  if (objDiv) {
   objDiv.scrollTop = objDiv.scrollHeight;
  }
};

export { scrolledDown }
