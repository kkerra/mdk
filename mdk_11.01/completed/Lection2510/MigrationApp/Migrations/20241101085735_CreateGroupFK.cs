﻿using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace MigrationApp.Migrations
{
    /// <inheritdoc />
    public partial class CreateGroupFK : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateIndex(
                name: "IX_Students_GroupId",
                table: "Students",
                column: "GroupId");

            migrationBuilder.AddForeignKey(
                name: "FK_Students_Groups_GroupId",
                table: "Students",
                column: "GroupId",
                principalTable: "Groups",
                principalColumn: "GroupId",
                onDelete: ReferentialAction.Cascade);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Students_Groups_GroupId",
                table: "Students");

            migrationBuilder.DropIndex(
                name: "IX_Students_GroupId",
                table: "Students");
        }
    }
}
