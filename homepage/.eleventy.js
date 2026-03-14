const rssPlugin = require("@11ty/eleventy-plugin-rss");
const syntaxHighlight = require("@11ty/eleventy-plugin-syntaxhighlight");

module.exports = function(eleventyConfig) {

    eleventyConfig.addPassthroughCopy("src/css/");
    eleventyConfig.addWatchTarget("src/css/");

    eleventyConfig.addPassthroughCopy("src/scripts/");
    eleventyConfig.addWatchTarget("src/scripts/");

    eleventyConfig.addPassthroughCopy("src/uploads/");
    eleventyConfig.addPassthroughCopy("src/assets/");
    eleventyConfig.addPassthroughCopy("src/.nojekyll");

    eleventyConfig.addPlugin(syntaxHighlight);

    return {
        dir: {
            input: "src",
            output: "public"
        },
        pathPrefix: "/summaries/",
    };
};