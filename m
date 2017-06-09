From: arnd@arndb.de (Arnd Bergmann)
Date: Fri, 9 Jun 2017 21:59:48 +0200
Subject: [PATCH 00/35] defconfig: Cleanup from old entries
In-Reply-To: <20170608160836.12196-1-krzk@kernel.org>
References: <20170608160836.12196-1-krzk@kernel.org>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <CAK8P3a3bUeC3H2oNfdBedVY4UTCe8OgKbWmv46d5xfu8tC7tAg@mail.gmail.com>
To: linux-snps-arc@lists.infradead.org

On Thu, Jun 8, 2017@6:08 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> Hi,
>
> While cleaning Samsung ARM defconfigs with savedefconfig, I encountered
> similar obsolete entries in other files.
>
> Except the ARM, no dependencies.
> For ARM, the rest of patches depend on the first change (otherwise
> it might not apply cleanly).

Great work!

I looked at all the ARM patches, and everything looks good to me (the
changlog linewrapping may be suboptimal for readability in some cases,
if I had to say anything negative ;-) ).

Please add my Acked-by to the ARM patches and send a pull request.

        Arnd
