From: krzk@kernel.org (Krzysztof Kozlowski)
Date: Sat, 10 Jun 2017 18:43:51 +0200
Subject: [PATCH 00/35] defconfig: Cleanup from old entries
In-Reply-To: <CAK8P3a3bUeC3H2oNfdBedVY4UTCe8OgKbWmv46d5xfu8tC7tAg@mail.gmail.com>
References: <20170608160836.12196-1-krzk@kernel.org>
 <CAK8P3a3bUeC3H2oNfdBedVY4UTCe8OgKbWmv46d5xfu8tC7tAg@mail.gmail.com>
List-ID: <linux-snps-arc@lists.infradead.org>
Message-ID: <20170610164351.7sxzvj4ojj3fbc7h@kozik-lap>
To: linux-snps-arc@lists.infradead.org

On Fri, Jun 09, 2017@09:59:48PM +0200, Arnd Bergmann wrote:
> On Thu, Jun 8, 2017@6:08 PM, Krzysztof Kozlowski <krzk@kernel.org> wrote:
> > Hi,
> >
> > While cleaning Samsung ARM defconfigs with savedefconfig, I encountered
> > similar obsolete entries in other files.
> >
> > Except the ARM, no dependencies.
> > For ARM, the rest of patches depend on the first change (otherwise
> > it might not apply cleanly).
> 
> Great work!
> 
> I looked at all the ARM patches, and everything looks good to me (the
> changlog linewrapping may be suboptimal for readability in some cases,
> if I had to say anything negative ;-) ).
> 
> Please add my Acked-by to the ARM patches and send a pull request.

Thanks, I'll send you ARM part in pull request.

As for the rest, I think respective arch/platform maintainers should
take it.

Best regards,
Krzysztof
