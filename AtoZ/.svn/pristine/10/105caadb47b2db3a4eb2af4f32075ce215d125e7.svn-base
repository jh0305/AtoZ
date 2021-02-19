<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<script type ="text/javascript">
console.log (navigator.bluetooth)
</script>
<button onclick ="connect()"> 스캔 </button>
<script>
async function connect () { 
     try {
          scan = await navigator.bluetooth.requestLEScan({
            acceptAllAdvertisements: true
          })
          navigator.bluetooth.addEventListener('advertisementreceived', event => {

            event.serviceData.forEach((valueDataView) => {  
              console.log(valueDataView.buffer)
            })
          })
        } catch (e) {
          if (e.code === 11) return
          if (e.code === 0) {
            alert('Bluetooth scanning permission denied. Please update browser settings to allow access.')
            return
          }
          console.log(e.message)
          alert(e.message)
        }
   }

</script>
</body>
</html>