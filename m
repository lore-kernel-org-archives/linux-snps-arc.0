Return-Path: <SRS0=s6v2=24=lists.infradead.org=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 918C8C33C8C
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 17:10:33 +0000 (UTC)
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mail.kernel.org (Postfix) with ESMTPS id 63C3F2087F
	for <linux-snps-arc@archiver.kernel.org>; Tue,  7 Jan 2020 17:10:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=lists.infradead.org header.i=@lists.infradead.org header.b="j48R9WgY"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 63C3F2087F
Authentication-Results: mail.kernel.org; dmarc=none (p=none dis=none) header.from=arndb.de
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20170209; h=Sender:
	Content-Transfer-Encoding:Content-Type:Cc:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:To:Subject:Message-ID:Date:From:
	In-Reply-To:References:MIME-Version:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7jB21wHIaF2UKykeAtVNwK8p0W8ZqxzlFeii9qZhE8Y=; b=j48R9WgYP210Dd
	gRHyQXFPf7BlYEVDm9ARHgYk2jkr8PpxqgN0YWIh2CdgpMfu8o9oEKB8549v5+JOr0onxHjYL/wzI
	q3bBTv/c1gSR3QxE9CmMUgxTiSFtnA2c44UrMyP9mxWmHUp/dSLYWo+SI5QBhwdbDHSG2k8R5y9gL
	YYzU+qEKQZyDzR4TS537A0YjyAbYQOyvIzVUP7JHY2f9CWHo/SzZ5sQuDPL08rH6mkeg/aP64t7j2
	0M8unr1t8sdKLgyFomNby0BYJbYOQMkhwgGFbef4X2MSkWq0cczAhIjX5nhoCnCvZEiGzjKBt+mfC
	4LHGyhK0d26uF2YbCong==;
Received: from localhost ([127.0.0.1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.92.3 #3 (Red Hat Linux))
	id 1iosNE-0000eM-DL; Tue, 07 Jan 2020 17:10:32 +0000
Received: from mout.kundenserver.de ([212.227.126.130])
 by bombadil.infradead.org with esmtps (Exim 4.92.3 #3 (Red Hat Linux))
 id 1iosNB-0000dV-Ok
 for linux-snps-arc@lists.infradead.org; Tue, 07 Jan 2020 17:10:31 +0000
Received: from mail-pl1-f176.google.com ([209.85.214.176]) by
 mrelayeu.kundenserver.de (mreue010 [212.227.15.129]) with ESMTPSA (Nemesis)
 id 1N0nzR-1jaMh545OH-00wjb2 for <linux-snps-arc@lists.infradead.org>; Tue, 07
 Jan 2020 18:10:27 +0100
Received: by mail-pl1-f176.google.com with SMTP id s21so20703135plr.7
 for <linux-snps-arc@lists.infradead.org>; Tue, 07 Jan 2020 09:10:26 -0800 (PST)
X-Gm-Message-State: APjAAAV5MuSGohk1SJidsja11QjTjVeKiUA0VPMTD84gA/jmDwQVUwQX
 MBoGrSstYfWP2DElGs5sepkSpSckcjPlHYZ0VqE=
X-Google-Smtp-Source: APXvYqxwO5AyDQus85+IK5BIt7KfSsh7NvpnQb9bzWV5OgyrFYMfLh14xqWUd9CW/X7TSfP34I+W9RVMaa5KUvf/Vb8=
X-Received: by 2002:a0c:bd20:: with SMTP id m32mr365813qvg.197.1578417023930; 
 Tue, 07 Jan 2020 09:10:23 -0800 (PST)
MIME-Version: 1.0
References: <1578415992-24054-1-git-send-email-krzk@kernel.org>
 <1578415992-24054-9-git-send-email-krzk@kernel.org>
In-Reply-To: <1578415992-24054-9-git-send-email-krzk@kernel.org>
From: Arnd Bergmann <arnd@arndb.de>
Date: Tue, 7 Jan 2020 18:10:07 +0100
X-Gmail-Original-Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Message-ID: <CAK8P3a1RibnRU6SiVjrOy-q+ZDdKacQgD9mrft_aHMgA9hm3PA@mail.gmail.com>
Subject: Re: [RFT 06/13] arc: Constify ioreadX() iomem argument (as in generic
 implementation)
To: Krzysztof Kozlowski <krzk@kernel.org>
X-Provags-ID: V03:K1:UG9L9JYgggbtFmaRVl+zrBp7VWsjXZvC6v+Q77a6n+0DwWBHA/i
 MLR+uWeZB4pMIjlQ1My6lO8QPcKbZWJDt2F1s5LnyTePos6A2PLY+zqzNkAyQz474j7bYCy
 nwU31xKKMTuxV0mf/LxP8t9P9Qo3Q9KzdB+5ilG9cCICqqTmzrSGT1U6mn2Zdlvta0tjnPj
 NRDIXizvALokta/cpG+pA==
X-UI-Out-Filterresults: notjunk:1;V03:K0:96cKG32r+UU=:cIp+WxFcRGMmzXpx7NnFeU
 n2Mm98lyE587cWANtYK5bFpYZqxBKJkOKUoS3eowo10f8pnURch/KW3o26p3GifIQvCShnxJY
 jrzuuRnoyBH8gZHHIVsyDUVAkFVg2GLCv4XoGXkDBUcLG8E6EV53PqnGz9sPx97LM6uWtwwVa
 0ZMicGb4Rft0HkH4MmhLa0XzdxL7QvUHrrq3f1fGLzrTtVsdSLsECsRVFkyk38w357F4ddBsc
 /Y2joF0++/CrtHE5LMtzgBZLYN7hc7o+krSyEDyroK1WFmjaUHs+9zvEeH5apVIT4ajKx3/Dd
 CE5zOdj+MXMNt1PQlqTtCXciu632VbsAWT5vEZp03dSPo5UlcdliZzlmR9UpxbMobi1xYZ1K3
 NcXp78Y0V8Tzcl1hlId1bdaA79ufsCU0503KJNWDImpkFTzzQz0bAywqvNpt5iQ1E3o5rJjIF
 4EkY/9LTn7+xRy6PDeAsEyHaOA5o6XKjYbebctJQh569Zu4eR+YewmMFf0eMMQKljk8gqvhUL
 KLLbHOlWpbG9+Vslf99VMpmj6qcpvMknQ+kOKB9uJZI9sOmz9K2Dua8bn9jR1rzY7PE29PDQK
 pHgcEeG7X3dcxXzJpGvxz8e8/IqMQcWlwpW1otg5Kt0MwNSm+Q6JipJBWts6hd8Hi2g+EAQfq
 7pxIGU20iR8v6jPXcoo+BeGUvRPOp+5eAMV5oNeWu5nxYFfdRenoT1QmEXTeyJBI1eKN236kT
 WnkNYEko6LSBOFQL7jLb0pk+ODhqhWUWeacoir1XN3nljA0oihE99uloIGc/M7rrmdhWWPzgT
 dyCBR2biiwEpuMmC5O2DAs23t7L1m9T53ce6MyzPcuoqddxfiKK6grh3I/ZFWdxlcmTMYxQk6
 UrtSpsSYfLbE67UCzE/w==
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20200107_091030_092679_348571CB 
X-CRM114-Status: GOOD (  11.63  )
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
Cc: Rich Felker <dalias@libc.org>, Jiri Slaby <jirislaby@gmail.com>,
 "Michael S. Tsirkin" <mst@redhat.com>, David Airlie <airlied@linux.ie>,
 Benjamin Herrenschmidt <benh@kernel.crashing.org>,
 Jason Wang <jasowang@redhat.com>, dri-devel <dri-devel@lists.freedesktop.org>,
 virtualization@lists.linux-foundation.org,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 Networking <netdev@vger.kernel.org>, Paul Mackerras <paulus@samba.org>,
 linux-arch <linux-arch@vger.kernel.org>, Dave Jiang <dave.jiang@intel.com>,
 Yoshinori Sato <ysato@users.sourceforge.jp>,
 Michael Ellerman <mpe@ellerman.id.au>, Helge Deller <deller@gmx.de>,
 Linux-sh list <linux-sh@vger.kernel.org>,
 Alexey Brodkin <abrodkin@synopsys.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Ben Skeggs <bskeggs@redhat.com>,
 ML nouveau <nouveau@lists.freedesktop.org>, Dave Airlie <airlied@redhat.com>,
 Matt Turner <mattst88@gmail.com>,
 "open list:SYNOPSYS ARC ARCHITECTURE" <linux-snps-arc@lists.infradead.org>,
 Nick Kossifidis <mickflemm@gmail.com>, Allen Hubbe <allenbh@gmail.com>,
 alpha <linux-alpha@vger.kernel.org>,
 Ivan Kokshaysky <ink@jurassic.park.msu.ru>,
 Thomas Gleixner <tglx@linutronix.de>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Kalle Valo <kvalo@codeaurora.org>,
 Richard Henderson <rth@twiddle.net>,
 Parisc List <linux-parisc@vger.kernel.org>, Vineet Gupta <vgupta@synopsys.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Luis Chamberlain <mcgrof@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Jon Mason <jdmason@kudzu.us>, linux-ntb@googlegroups.com,
 Andrew Morton <akpm@linux-foundation.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 linuxppc-dev <linuxppc-dev@lists.ozlabs.org>,
 "David S. Miller" <davem@davemloft.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

On Tue, Jan 7, 2020 at 5:54 PM Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> The ioreadX() helpers have inconsistent interface.  On some architectures
> void *__iomem address argument is a pointer to const, on some not.
>
> Implementations of ioreadX() do not modify the memory under the
> address so they can be converted to a "const" version for const-safety
> and consistency among architectures.
>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>

The patch looks correct, but I would not bother here, as it has no
effect on the compiler or its output.

      Arnd

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
