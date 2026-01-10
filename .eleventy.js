module.exports = function (eleventyConfig) {
  // Copy assets folder to output
  eleventyConfig.addPassthroughCopy("assets");
  eleventyConfig.addPassthroughCopy("style.css");

  // Watch CSS files for changes
  eleventyConfig.addWatchTarget("./style.css");
  eleventyConfig.addWatchTarget("./assets/");

  return {
    dir: {
      input: "src",
      output: "_site",
      includes: "_includes",
      data: "_data",
    },
    templateFormats: ["html", "njk", "md"],
    htmlTemplateEngine: "njk",
    markdownTemplateEngine: "njk",
  };
};
