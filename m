From: rostedt@goodmis.org (Steven Rostedt)
Date: Fri, 25 Aug 2017 11:12:00 -0400
Subject: [PATCH] OF: move extern declarations of entry pointers inside
 ifdef
In-Reply-To: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
References: <20170825150027.25341-1-Eugeniy.Paltsev@synopsys.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170825111200.5f0891a5@gandalf.local.home>
To: linux-snps-arc@lists.infradead.org

On Fri, 25 Aug 2017 18:00:26 +0300
Eugeniy Paltsev <Eugeniy.Paltsev@synopsys.com> wrote:

> Move extern declarations of "of_root", "of_chosen", "of_aliases",
> "of_stdout" pointers inside "CONFIG_OF" ifdef to be able to get rid
> of "CONFIG_OF" ifdef in their usage places.
> 
> Suggested-by: Steven Rostedt <rostedt at goodmis.org>

Thanks!

-- Steve

> 
> Signed-off-by: Eugeniy Paltsev <Eugeniy.Paltsev at synopsys.com>
> ---
