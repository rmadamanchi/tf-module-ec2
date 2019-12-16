output "instance_id" {
  value = "${aws_instance.main.id}"
}

output "instance_arn" {
  value = "${aws_instance.main.arn}"
}
