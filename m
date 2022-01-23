Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16194C433EF
	for <linux-snps-arc@archiver.kernel.org>; Sun, 23 Jan 2022 10:25:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=7PpkcMKIdPCAyiKbCwRa64+kHSbCCt6GNjEGhBeO1/A=; b=I/I5Ei2qkpJ0xn
	ZgS+aqOp1RGuUvMknweqiwMG5+bt/iRUTTax70PkZXIBMum2+38wdPnu5FjveSWPr6FCYH3yfudi9
	wKnmWHNQ0t6ujUPgctQ/nxfQPYpVacKSvWRxSBmWt8pbxJH6MFuNhEZ6yTEL/equRz0kYHbMJE6lz
	YX10eFxgE4zRf73iFmfVvoAaKyQMFHK5rc9QFYegFxzgeuoVeu83rS6KXZDE+1Mc6Q+iySI/R3gmi
	VVCdHVsRIietP+BvziQStCpUmQBYGmqqojg75GLaYpoVSMYzeZXo9tCl86pUf45dT363+xf8w+/LW
	zhKSe8l4jz2UPlazcORQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1nBa3r-000bS6-L1; Sun, 23 Jan 2022 10:25:27 +0000
Received: from mail.tintel.eu ([51.83.127.189])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1nBa3o-000bRH-Af
 for linux-snps-arc@lists.infradead.org; Sun, 23 Jan 2022 10:25:26 +0000
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id 477EB447370D;
 Sun, 23 Jan 2022 11:25:15 +0100 (CET)
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10032)
 with ESMTP id ObWlqL9Fhlh0; Sun, 23 Jan 2022 11:25:14 +0100 (CET)
Received: from localhost (localhost [IPv6:::1])
 by mail.tintel.eu (Postfix) with ESMTP id C9E344473709;
 Sun, 23 Jan 2022 11:25:14 +0100 (CET)
DKIM-Filter: OpenDKIM Filter v2.10.3 mail.tintel.eu C9E344473709
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux-ipv6.be;
 s=502B7754-045F-11E5-BBC5-64595FD46BE8; t=1642933514;
 bh=eh5MNbVD3HN9NR16+hKnqIphI5p+pfiG9P9Wx/W5T1Q=;
 h=Message-ID:Date:MIME-Version:To:From;
 b=tSoXAPFh3hPZCaVhA9GL12gnGKqtzgS+zQP4QK1WqdrJm37zq6hbsrH9AMnTtqBvm
 5XaqGrUOZih701e6WAhYrOmn6ex7F0XmwKirj+Lu8Y+Rwx1BwX3szSzKgd8lZRi6AC
 ohdgetnix4RenGxxp0H4uvuydiJz3/whnt3p5EJ0=
X-Virus-Scanned: amavisd-new at mail.tintel.eu
Received: from mail.tintel.eu ([IPv6:::1])
 by localhost (mail.tintel.eu [IPv6:::1]) (amavisd-new, port 10026)
 with ESMTP id OACUer2WgRyU; Sun, 23 Jan 2022 11:25:14 +0100 (CET)
Received: from [IPV6:2001:67c:21bc:20::10] (unknown
 [IPv6:2001:67c:21bc:20::10]) (Authenticated sender: stijn@tintel.eu)
 by mail.tintel.eu (Postfix) with ESMTPSA id C45D64473703;
 Sun, 23 Jan 2022 11:25:13 +0100 (CET)
Message-ID: <e91d8951-221b-860e-cd27-32a303382a9f@linux-ipv6.be>
Date: Sun, 23 Jan 2022 12:25:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.5.0
Subject: Re: [PATCH] arc770: Remove arc770 target
Content-Language: en-GB
To: Hauke Mehrtens <hauke@hauke-m.de>, openwrt-devel@lists.openwrt.org
Cc: Alexey.Brodkin@synopsys.com, linux-snps-arc@lists.infradead.org
References: <20220122192426.13455-1-hauke@hauke-m.de>
From: Stijn Tintel <stijn@linux-ipv6.be>
In-Reply-To: <20220122192426.13455-1-hauke@hauke-m.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220123_022524_717036_9810FAE2 
X-CRM114-Status: GOOD (  10.05  )
X-BeenThere: linux-snps-arc@lists.infradead.org
X-Mailman-Version: 2.1.34
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

On 22/01/2022 21:24, Hauke Mehrtens wrote:
> The arc700 target is not booting up since some time, see here:
> https://github.com/foss-for-synopsys-dwc-arc-processors/toolchain/issues/400
>
> It looks like there is a problem in the toolchain when using glibc.
>
> Currently no one is working on fixing this problem, remove the target
> instead. This target also does not have many users we are aware of.
>
> If someone wants to have this target back, feel free to add a fixed
> version of this target again.
>
> Signed-off-by: Hauke Mehrtens <hauke@hauke-m.de>
Acked-by: Stijn Tintel <stijn@linux-ipv6.be>

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
