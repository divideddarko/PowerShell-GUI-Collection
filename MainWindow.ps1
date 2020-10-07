<#
    .SYNOPSIS
    Short description

    .DESCRIPTION
    Long description

    .EXAMPLE
    An example

    .NOTES
    General notes
    #>

# Add reference library
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Windows.Forms")
[void] [System.Reflection.Assembly]::LoadWithPartialName("System.Drawing")

# Set your colour scheme for the project
$SCRIPT:GreyColour = [System.Drawing.Color]::FromArgb(26, 26, 26)
$SCRIPT:MainWindowColour = [System.Drawing.Color]::FromArgb(38, 38, 38)
$SCRIPT:White = [System.Drawing.Color]::FromArgb(255, 255, 255)
$SCRIPT:Blue = [System.Drawing.Color]::FromArgb(82, 136, 174)
$SCRIPT:Green = [System.Drawing.Color]::FromArgb(138, 199, 68)
$SCRIPT:Black = [System.Drawing.Color]::FromArgb(0, 0, 0)
# Fonts to be used within the script
$SCRIPT:Font = New-Object System.Drawing.Font("Calibri", 16)

# Set GUI Window defaults
$MainWindow = New-Object System.Windows.Forms.Form
# Set the size of the Window
$MainWindow.ClientSize = New-Object System.Drawing.Size(1000, 900)
# Select where the window should display on launch
$MainWindow.StartPosition = "CenterScreen"
# Set the background colour to the window
$MainWindow.BackColor = $MainWindowColour
# Below the border for the window is set to none this means it won't have the normal functionality such as Minimize, restore or Close we can add these later
$MainWindow.FormBorderStyle = "None"
# This means that the window doesn't always appear on top so it can be used as a normal window.
$MainWindow.TopMost = $false

# Label brilliant for short structures of text such as the display for Username next to an input field, or a header, or footer comment
$Label = New-Object System.Windows.Forms.Label
# The text that you would like it to display
$Label.Text = "This is a label"
# The size of the object a little more tricky if you don't know the text
$Label.Size = New-Object System.Drawing.Size(200, 30)
# Set the location of the label within the window
$Label.Location = New-Object System.Drawing.Point(7, 7)
# Set the font colour
$Label.ForeColor = $White
# Set the background color
$Label.BackColor = $MainWindowColour
# How should the font look
$Label.Font = $Font


# Rich textbox fantastic for displaying data or writing data within
$RichText = New-Object System.Windows.Forms.RichTextBox
# Set the size of the RichTextBox I have made it the size compared to the main window so if one changes it will also adapt
$RichText.Size = New-Object System.Drawing.Size ($($MainWindow.Width - 50), $($MainWindow.Height / 4))
# Set the location of the RichTextBox again this alters based on the MainWindow Size and the size of the RichTextBox
$RichText.Location = New-Object System.Drawing.Point ($($MainWindow.Width - ($MainWindow.Width - 25)), $($MainWindow.Height - $($RichText.Height + 40)))
# ReadOnly allows the users to add their own text or you can leave it so it only displays as an output
$RichText.ReadOnly = $true
# Show text on multiple lines
$RichText.MultiLine = $true
# If the Mainwindow is resized how does the RichtextBox react, in this case it will also change size to fit the different size of the MainWindow
$RichText.Anchor = "Left, Bottom, Right"
# Remove the border
$RichText.BorderStyle = 0
# Background colour
$RichText.BackColor = $Black
# Text Colour
$RichText.ForeColor = $White
# Set the font type I like to have a standard font so have a SCRIPT Variable so it only affects it whilst this tool is running
$RichText.Font = $Font
# Initial text you might want in the RichTextBox
$RichText.Text = "hello World"
# You are able to add extra text as you see fit.
$RichText.AppendText("`nWe can do some fantastic things with this text here.")

# Add a button
$Button = New-Object System.Windows.Forms.Button
# What should the button say
$Button.Text = "Test Progress Bar"
# How big should the button be (L, H)
$Button.Size = New-Object System.Drawing.Size(100, 40)
# Where should the button be displayed
$Button.Location = New-Object System.Drawing.Point(25, $($MainWindow.Height - ($Button.Height + $RichText.Height + 55)))
# What colour should the button text be
$Button.ForeColor = $White
# What cursor should display on hover
$Button.Cursor = "Hand"
# What action should happen when the button is pressed.
$Button.Add_Click( {
        $Total = 1000000
        for ($i = 0; $i -le $Total; $i++) {
            $ProgressBar.Value = $i / $Total * 100
        }
    })

# A progress bar to see what % is complete
$ProgressBar = New-Object System.Windows.Forms.ProgressBar
# A fixed size on this project
$ProgressBar.Size = New-Object System.Drawing.Size(350, 20)
# Again position based on inital window setup
$ProgressBar.Location = New-Object System.Drawing.Point($($MainWindow.Width - ($ProgressBar.Width + 25)), $($MainWindow.Height - $($ProgressBar.Height + 10)))
# An example % complete, this can be updated as you run your script which will be shown with a button above
$ProgressBar.Value = 50
# Colour the % bar
$ProgressBar.ForeColor = $White
# Colour of the ProgressBar Background
$ProgressBar.BackColor = $Blue
# Linked to the Bottom right, so if the window is expanded it only moves with the bottom right of the window keeping its size and location
$ProgressBar.Anchor = "Bottom, Right"
# There are 3 styles, Blocks, Continuous and Marquee
$ProgressBar.Style = "Continuous"
# Show and hide the Progressbar fantastic to hide when not in use so the user doesn't feel they are waiting on anything
$ProgressBar.Visible = $true





# Add items to the MainWindow, the order matters the futher up the list it'll appear above other items
$MainWindow.Controls.Add($Label)
$MainWindow.Controls.Add($Button)
$MainWindow.Controls.Add($RichText)
$MainWindow.Controls.Add($ProgressBar)

# Display the window
[void]$MainWindow.ShowDialog()