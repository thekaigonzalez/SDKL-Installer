import std.getopt;
import std.stdio;
import std.net.curl;
import std.file;
import std.process;
void main(string[] args)
{
  bool verbose_info = false;
  string path = "/";
  string[] libs;
  try {
   getopt(args, std.getopt.config.bundling, "verbose|v", &verbose_info, "path|p", &path
   ,"lib|l", &libs);
  }
  catch (GetOptException e)
  {
    writeln(args[0]~": bad usage");
  }
  writeln("Kux installer: 1.0");
  if (verbose_info) { writeln("-v: downloading SDKL-recent from https://thekaigonzalez.github.io/mirrors/SDKL");  } // give the user information on what we're going to be achieving.
  writeln("Working magic...");

    writeln("after this installation, SDKL will be installed ***LOCALLY*** on this hard drive.\nwould you like to continue?");
    printf("[y/n]");
    int c = getchar();
    if (c == 121) {
      download("https://raw.githubusercontent.com/thekaigonzalez/SDKL/master/src/sdkl", "./sdkl");
      writeln("Copying ./sdkl to /usr/local/bin/sdkl (sudo cp ./sdkl /usr/local/bin/sdkl)");
      executeShell("sudo cp ./sdkl /usr/local/bin/sdkl");
      writeln("done!");
    } else {
      writeln("open: permission denied");
    }
}
