namespace Task1
{
    partial class Form1
    {
        /// <summary>
        ///  Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        ///  Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        ///  Required method for Designer support - do not modify
        ///  the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            filesDataGridView = new DataGridView();
            task1Button = new Button();
            task2Button = new Button();
            task3Button = new Button();
            task4Button = new Button();
            task5Button = new Button();
            task6Button = new Button();
            searchTextBox = new TextBox();
            task8Button = new Button();
            searchCountTextBox = new TextBox();
            ((System.ComponentModel.ISupportInitialize)filesDataGridView).BeginInit();
            SuspendLayout();
            // 
            // filesDataGridView
            // 
            filesDataGridView.Anchor = AnchorStyles.Top | AnchorStyles.Left | AnchorStyles.Right;
            filesDataGridView.BackgroundColor = Color.White;
            filesDataGridView.ColumnHeadersHeightSizeMode = DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            filesDataGridView.Location = new Point(12, 12);
            filesDataGridView.Name = "filesDataGridView";
            filesDataGridView.Size = new Size(796, 307);
            filesDataGridView.TabIndex = 0;
            // 
            // task1Button
            // 
            task1Button.Location = new Point(12, 345);
            task1Button.Name = "task1Button";
            task1Button.Size = new Size(75, 23);
            task1Button.TabIndex = 1;
            task1Button.Text = "Task1";
            task1Button.UseVisualStyleBackColor = true;
            task1Button.Click += Task1Button_Click;
            // 
            // task2Button
            // 
            task2Button.Location = new Point(124, 345);
            task2Button.Name = "task2Button";
            task2Button.Size = new Size(75, 23);
            task2Button.TabIndex = 2;
            task2Button.Text = "Task2";
            task2Button.UseVisualStyleBackColor = true;
            task2Button.Click += Task2Button_Click;
            // 
            // task3Button
            // 
            task3Button.Location = new Point(239, 345);
            task3Button.Name = "task3Button";
            task3Button.Size = new Size(75, 23);
            task3Button.TabIndex = 3;
            task3Button.Text = "Task3";
            task3Button.UseVisualStyleBackColor = true;
            task3Button.Click += Task3Button_Click;
            // 
            // task4Button
            // 
            task4Button.Location = new Point(352, 345);
            task4Button.Name = "task4Button";
            task4Button.Size = new Size(75, 23);
            task4Button.TabIndex = 4;
            task4Button.Text = "Task4";
            task4Button.UseVisualStyleBackColor = true;
            task4Button.Click += Task4Button_Click;
            // 
            // task5Button
            // 
            task5Button.Location = new Point(468, 345);
            task5Button.Name = "task5Button";
            task5Button.Size = new Size(75, 23);
            task5Button.TabIndex = 5;
            task5Button.Text = "Task5";
            task5Button.UseVisualStyleBackColor = true;
            task5Button.Click += Task5Button_Click;
            // 
            // task6Button
            // 
            task6Button.Location = new Point(585, 345);
            task6Button.Name = "task6Button";
            task6Button.Size = new Size(75, 23);
            task6Button.TabIndex = 6;
            task6Button.Text = "Task6";
            task6Button.UseVisualStyleBackColor = true;
            task6Button.Click += Task6Button_Click;
            // 
            // searchTextBox
            // 
            searchTextBox.Location = new Point(339, 387);
            searchTextBox.Name = "searchTextBox";
            searchTextBox.Size = new Size(100, 23);
            searchTextBox.TabIndex = 7;
            // 
            // task8Button
            // 
            task8Button.Location = new Point(700, 345);
            task8Button.Name = "task8Button";
            task8Button.Size = new Size(75, 23);
            task8Button.TabIndex = 9;
            task8Button.Text = "Task8";
            task8Button.UseVisualStyleBackColor = true;
            task8Button.Click += Task8Button_Click;
            // 
            // searchCountTextBox
            // 
            searchCountTextBox.Location = new Point(690, 387);
            searchCountTextBox.Name = "searchCountTextBox";
            searchCountTextBox.Size = new Size(100, 23);
            searchCountTextBox.TabIndex = 10;
            // 
            // Form1
            // 
            AutoScaleDimensions = new SizeF(7F, 15F);
            AutoScaleMode = AutoScaleMode.Font;
            ClientSize = new Size(820, 438);
            Controls.Add(searchCountTextBox);
            Controls.Add(task8Button);
            Controls.Add(searchTextBox);
            Controls.Add(task6Button);
            Controls.Add(task5Button);
            Controls.Add(task4Button);
            Controls.Add(task3Button);
            Controls.Add(task2Button);
            Controls.Add(task1Button);
            Controls.Add(filesDataGridView);
            Name = "Form1";
            Text = "Form1";
            ((System.ComponentModel.ISupportInitialize)filesDataGridView).EndInit();
            ResumeLayout(false);
            PerformLayout();
        }

        #endregion

        private DataGridView filesDataGridView;
        private Button task1Button;
        private Button task2Button;
        private Button task3Button;
        private Button task4Button;
        private Button task5Button;
        private Button task6Button;
        private TextBox searchTextBox;
        private Button task8Button;
        private TextBox searchCountTextBox;
    }
}
