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


# Add a button
$Button = New-Object System.Windows.Forms.Button
# What should the button say
$Button.Text = "This is a button"
# How big should the button be (L, H)
$Button.Size = New-Object System.Drawing.Size(100, 40)
# Where should the button be displayed
$Button.Location = New-Object System.Drawing.Point(7, 7)
# What colour should the button text be
$Button.ForeColor = $White
# What cursor should display on hover
$Button.Cursor = "Hand"
# What action should happen when the button is pressed.
$Button.Add_Click( {
        Write-Host "Hello World"
    })


# Rich textbox fantastic for displaying data or writing data within
$RichText = New-Object System.Windows.Forms.RichTextBox
# Set the size of the RichTextBox I have made it the size compared to the main window so if one changes it will also adapt
$RichText.Size = New-Object System.Drawing.Size ($($MainWindow.Width - 50), $($MainWindow.Height / 4))
# Set the location of the RichTextBox again this alters based on the MainWindow Size and the size of the RichTextBox
$RichText.Location = New-Object System.Drawing.Point ($($MainWindow.Width - ($MainWindow.Width - 25)), $($MainWindow.Height - $($Richtext.Height + 25)))
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



# Add items to the MainWindow, the order matters the futher up the list it'll appear above other items
$MainWindow.Controls.Add($Button)
$MainWindow.Controls.Add($RichText)

# Display the window
[void]$MainWindow.ShowDialog()