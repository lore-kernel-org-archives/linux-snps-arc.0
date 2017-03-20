From: yamada.masahiro@socionext.com (Masahiro Yamada)
Date: Mon, 20 Mar 2017 22:54:13 +0900
Subject: [PATCH 3/6] arc: Use full path in KBUILD_IMAGE definition
In-Reply-To: <20161122213434.14788-3-mmarek@suse.com>
References: <20161122213434.14788-1-mmarek@suse.com>
 <20161122213434.14788-3-mmarek@suse.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK7LNASiseJXVu5cmEuYKFdTa2DEcSV536zdzSBychb5mXWXQA@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

2016-11-23 6:34 GMT+09:00 Michal Marek <mmarek at suse.com>:
> The KBUILD_IMAGE variable is used by the rpm and deb-pkg targets, which
> expect it to point to the image file in the build directory. The
> builddeb script has a workaround for architectures which only provide
> the basename, but let's provide a clean interface for packaging tools.
>
> Cc: Vineet Gupta <vgupta at synopsys.com>
> Cc: linux-snps-arc at lists.infradead.org
> Signed-off-by: Michal Marek <mmarek at suse.com>



Applied to linux-kbuild/misc.  Thanks!



-- 
Best Regards
Masahiro Yamada
