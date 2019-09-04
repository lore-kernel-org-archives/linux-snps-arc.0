From: vineetg76@gmail.com (Vineet Gupta)
Date: Tue, 3 Sep 2019 20:08:45 -0700
Subject: [PATCH 2/3] kbuild, arc: add
 CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3 for ARC
In-Reply-To: <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
References: <20190820170941.26193-1-yamada.masahiro@socionext.com>
 <20190820170941.26193-2-yamada.masahiro@socionext.com>
 <ed251c63-10e0-bd8a-1a9b-be9ade5cad3f@gmail.com>
 <CAK7LNARd1KFq=GRYQUr16KaiiRzh4ARX5eOpcRcUrZSVgHdhJA@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <c9ff7cad-d3bb-1367-e7c1-0d22fd542903@gmail.com>
To: linux-snps-arc@lists.infradead.org

On 9/3/19 8:08 AM, Masahiro Yamada wrote:
>> So if you could please split out the Wmaybe-uninitialized change
> I could not understand your request.
>
> I added 'imply CC_DISABLE_WARN_MAYBE_UNINITIALIZED'
> for CONFIG_CC_OPTIMIZE_FOR_PERFORMANCE_O3.
>
> I cannot split it out. Otherwise, you will see false-positive
> maybe-uninitialized warnings.

Sorry I must have overlooked this part. So no issues now !

Thx,
-Vineet
