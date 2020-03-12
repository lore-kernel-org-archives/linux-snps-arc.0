Return-Path: <SRS0=RZv2=45=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AAEEC5ACBF
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 08:01:46 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 2743120650
	for <linux-snps-arc@archiver.kernel.org>; Thu, 12 Mar 2020 08:01:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="ucZoCZzC";
	dkim=fail reason="signature verification failed" (2048-bit key) header.d=xs4all.nl header.i=@xs4all.nl header.b="S5pQfgbO"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 2743120650
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=xs4all.nl
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:Date:
	Message-ID:From:References:To:Subject:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Owner;
	bh=lNphHQP9NBPPA+L09Pykf65SLfEAZTzlmxyw/e7qNk8=; b=ucZoCZzCzGtgZfk+WI9UqKxmFW
	0q9oCgf70QxSxcaQUkDXsQXnjdNDR4ZI7HTSLpJf4kZKRp1K2VtyjaHZ3y0V/DNz6DhO9XrCPtHXY
	lXb6zmBOYlmnl38Lv6ZFWQsEfuH+Jenv+4jpbnCkwRdoEQq0wiCegofS0AGmtCN0seLOelsXJ8ffh
	dG0IbAnG8F6OFt+brZZYvpS5bzlU8UknJwiqFQ52cQqhoJ24lkljTsDM++PBvoXh/CRbWfkOjSuKP
	XDs1l0EAo02PCZJrZnbDN2i5mkZK/nZUZS56YB1gpJDrtfl065y2BWcm8dCGWFYL84fjIPj48Vgh2
	Vm+0Gq9Q==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1jCIml-0006PL-U1; Thu, 12 Mar 2020 08:01:43 +0000
Received: from lb1-smtp-cloud9.xs4all.net ([194.109.24.22])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1jCImj-0006OR-4S
 for linux-snps-arc@lists.infradead.org; Thu, 12 Mar 2020 08:01:42 +0000
Received: from [192.168.2.10] ([46.9.234.233])
 by smtp-cloud9.xs4all.net with ESMTPA
 id CImQjXGct9Im2CImTjipFx; Thu, 12 Mar 2020 09:01:37 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=xs4all.nl; s=s1;
 t=1584000098; bh=rlvXrsquCgOAoL6m3j4naIDiZk45jPg5qzfaHkH6ylc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version:Content-Type:From:
 Subject;
 b=S5pQfgbOLIHhQdw0W7sV5AZx/O5rbzeyPt7bFpTNkwgO8Qy0BKq+Rvjmju5L2B424
 ts5RJaST/5DSO90woF88XEKoVSWzdXA1+cYgXtZ9lrnSZ/voNQNCc/kNcDWB/9eH8q
 oukXvG+APHr07xXyoiRVnfNAIu0NoRyJO4gRl7kMox10FOdeAVa4C86hGVXEgWIL1z
 DHpeiiUb+PUHWBRHnftozp83wtSCPlDu/KR0wA5Tus7873ErMhZjEh0V/cX/LLr9QJ
 GcvLzWg4JtL3YxsnzXI28YMgDuIhwtNvDRGPXfnFqtov7CBrtU3S5QfdwsKM1K25I6
 WU1k8NIIoVM6w==
Subject: Re: [RESEND PATCH v2 8/9] media: fsl-viu: Constify ioreadX() iomem
 argument (as in generic implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>, Richard Henderson
 <rth@twiddle.net>, Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Matt Turner <mattst88@gmail.com>, Alexey Brodkin <abrodkin@synopsys.com>,
 Vineet Gupta <vgupta@synopsys.com>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Helge Deller <deller@gmx.de>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Paul Mackerras <paulus@samba.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Yoshinori Sato <ysato@users.sourceforge.jp>, Rich Felker <dalias@libc.org>,
 Dave Airlie <airlied@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, Ben Skeggs <bskeggs@redhat.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Jiri Slaby
 <jirislaby@gmail.com>, Nick Kossifidis <mickflemm@gmail.com>,
 Luis Chamberlain <mcgrof@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 "David S. Miller" <davem@davemloft.net>, Dave Jiang <dave.jiang@intel.com>,
 Jon Mason <jdmason@kudzu.us>, Allen Hubbe <allenbh@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowang@redhat.com>,
 Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert+renesas@glider.be>,
 Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, linux-alpha@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-snps-arc@lists.infradead.org,
 linux-parisc@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-sh@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-media@vger.kernel.org,
 linux-wireless@vger.kernel.org, netdev@vger.kernel.org,
 linux-ntb@googlegroups.com, virtualization@lists.linux-foundation.org,
 linux-arch@vger.kernel.org
References: <20200219175007.13627-1-krzk@kernel.org>
 <20200219175007.13627-9-krzk@kernel.org>
From: Hans Verkuil <hverkuil@xs4all.nl>
Message-ID: <1c4a11b5-5ca6-7555-de3c-ff30f707fac7@xs4all.nl>
Date: Thu, 12 Mar 2020 09:01:22 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.5.0
MIME-Version: 1.0
In-Reply-To: <20200219175007.13627-9-krzk@kernel.org>
Content-Language: en-US
X-CMAE-Envelope: MS4wfB1zxMJIE7wElbGm4sdMecyYLJ6LdsDMDpZDeSQuVKwPm0HLBt9h+mOdrGXFuIDkCI9Ox7ukCv0Xr+wsEhOQPNuuqPOa2tbCK6oF1PNdZVqk6thKvC3h
 xE4aE9bNSUWOFhWxTazaeGPVr5hr0AhveAgdpPWZHpjhg5PxgtKgtRwcEM0X31YjusYjKeuEG9QF/4JOHzjohAIjiR+oAI0nyED+Jez9yI4FW1ZB3LXkp8TH
 7MMndY8iJadjMhsV5+oGTHeP7z8vzm/dZU83psQzhxRsPonohHX17/JsKF2l5MFAT9+97UKYOiKAsfrv1Cpys4Ae5wkTvdw4qsE49ssk4hjAoyha0QB9BVju
 9SGy1FrSenK0frRjbC8NaYY9ZERWNSiNH5LA36WXT5yWf3v+Qcv3MkgEimaOp41P2nlVLuOjtsbM7Oc0IE2oIVVfFA700ZJiP3znlyaVddewRuZDpRVP7LaM
 BmiWSHGXgw8YtQmC7z4+FTtlDdPcaOnURURbGtwGqrG9ypYOfWaczdFyon9cFrdpqrNkvqRjWmqFa6YgsB57xqLqvFfcZaXIx/5GPRUQudUCvZPJzisakVQc
 uttKYb/aM3WYuhJM4Wb1Pv6BrMYMIVXGCFsOBd7W/xp0N3iMBGSYj0Aa0rPNR8hHdzbHBC2fjWlNKKBiBqoznNqCGZ0CiVQoEM+QtyRRgiYnx6PeAm5PLOc4
 VNFQmhkOpnD9IFKzOg7MDbXsSwg+OAG64qEuG/VscrSiDVQ1yjv5knp7CxhKGvYM4OpGHYT1Er7Bdx2FCmXu/yAwSbBDRagCD0kotDKUph18wrkxxeFljDJA
 LSc1aSxY7WzE0MoB4x1WWy+jz94FDlyhtSMwiZ6y0dJP3+c2+Q5En242uHE069S9l+7oW8v5MGbWOStqt5f3vSjCb7LIzWN87JmuP89GFWwWLJsughS7GMyf
 9DHMMrFLvERXtynUPrxsXWOFJFYcfPWtUSuDRlT6lyW4OqviXxQxmuwWWPzBiEuN74qNtI+js8zLo4yvgjsgXCeSGNoTx+kuEqyjk5W1UzIpidGK0CRrnVbE
 6hD9Y/vETMZdaCRGTPOlU05njcJF+46w8BJ3SNj0Py3qBk1dX7c6nBfbFypmWYBFmuncdfgfV+GvZgph5pgPHOoQxVCf/tLCrfA6lP3T+1yMX4df+BQFRKLS
 O4WmDF2MxF8KloewGsYz/rsmgB25E6V0YSDc8EvmqseT2P6A01f6bsdZt1AJnufocp+H44s+qhBR6buNUUMphP9KyIyYuNbtmFvkGTyK649jUP2q8Nik1rK1
 3AqiAYrtsks7Dqmq5Qj7chR5DBva/WjXbTAi9lRBeyrc1LiDTAHtFBMmOGm8QJ0PstgU+Qss/H31YuyO+vowQc/YkfqDiEmsIU7MZy0525QlKJCDuomrR9k/
 pt0L69OpaODhDI2GKeTabUJfloUo1rGwDFifFZ3GiczPZsdGrTGULzWF8ZqXdk44Vxmf+o40QJa4goBPwv+YDuim0xPrbohAaaGJnTcviLLAbx0Be2IOpJK7
 066IFrJvKfz7/Wp2S67JJX5FtbO7VF+IrVN/N63uvfJb+FM6hLMjwGqczE7h5AhCTMRfIsHhAU9mTIYVyLN+UBlZ3WL3ahk0SjumGQqE2df8rbpt41Yx3WFA
 IW77guEXBH/AFWkGJEIg2a3N91fXva0TdPJAF0YzlkCOnwCmb9/Naw==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200312_010141_335806_EE221619 
X-CRM114-Status: GOOD (  16.33  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux on Synopsys ARC Processors <linux-snps-arc.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-snps-arc/>
List-Post: <mailto:linux-snps-arc@lists.infradead.org>
List-Help: <mailto:linux-snps-arc-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-snps-arc>, 
 <mailto:linux-snps-arc-request@lists.infradead.org?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On 2/19/20 6:50 PM, Krzysztof Kozlowski wrote:
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
> 
> Implementations of ioreadX() do not modify the memory under the address
> so they can be converted to a "const" version for const-safety and
> consistency among architectures.
> 
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

Acked-by: Hans Verkuil <hverkuil-cisco@xs4all.nl>

Regards,

	Hans

> ---
>  drivers/media/platform/fsl-viu.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/fsl-viu.c b/drivers/media/platform/fsl-viu.c
> index 81a8faedbba6..991d9dc82749 100644
> --- a/drivers/media/platform/fsl-viu.c
> +++ b/drivers/media/platform/fsl-viu.c
> @@ -34,7 +34,7 @@
>  /* Allow building this driver with COMPILE_TEST */
>  #if !defined(CONFIG_PPC) && !defined(CONFIG_MICROBLAZE)
>  #define out_be32(v, a)	iowrite32be(a, (void __iomem *)v)
> -#define in_be32(a)	ioread32be((void __iomem *)a)
> +#define in_be32(a)	ioread32be((const void __iomem *)a)
>  #endif
>  
>  #define BUFFER_TIMEOUT		msecs_to_jiffies(500)  /* 0.5 seconds */
> 


_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
