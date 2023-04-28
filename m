Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 765EAC77B60
	for <linux-snps-arc@archiver.kernel.org>; Fri, 28 Apr 2023 13:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:MIME-Version:References:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=YsFR6kWowYrR78N1S2PfGrRZLyK9qL9qmkfcChUllJU=; b=nfMUOrEUUH173I
	JxO1nUwXrS3eDiiy9+rURjkJ5n4c7eooJAxzDNezss+opcgbNej2ikKedTyAnnfcPQoYLHHzRRl4D
	Ql3tXOl+AVMLiy95HxCb93D7WzfmA4I/NqDVCvgl/o+TlbdzXGYyGAElyvd8XOO996RfcenCY3pb/
	zqXHXqi5ALDOz20TlfKDdaLKYxeQbp5qjjIhMJWsmViztYXhdjP5MaUX5Y3/3Eo7avYT1QLS+DL/5
	QpD+YDUByGoMwZRlA7rXrA9IRG/iB3EObiLIX94tt4r/vI1B4X82Ly9u0igchWRTsZwMuRdx9Vzbv
	lZNt2YQ+dMUCxkAypMMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1psNil-00A86y-09;
	Fri, 28 Apr 2023 13:01:07 +0000
Received: from mailrelay1-1.pub.mailoutpod2-cph3.one.com ([2a02:2350:5:400::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1psNie-00A7xs-2S
	for linux-snps-arc@lists.infradead.org;
	Fri, 28 Apr 2023 13:01:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=rsa1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=PpcTclKxx1k/EfVG4yQr41oM9QVmOB40SVMjWl/npqE=;
	b=k3xZbk49OVdA8HAM23WQf7QvCAkY6osK5NwKaYOCelNTZEEDAi5JLJORKG53rPRLHF2UsEnaWjci2
	 UleSovMJWsiI88ObSwz3BFTTOjC+dvZXpyhqmAh22eCaseqhpMutcTvgyACjthLZQisPTD+USiia7s
	 6ImH25NiJgbL2Q/PjF4KyEFzSNpy8jfrpmufZNF/jOHLpQUWwx5qYXdybf4Iwxxx7/NKm+hQtW2Q3P
	 cyW5mCcjWaxt6Qws7WctuxhcfLpL4nVXl+aSBhVeYilixYQs5Of8ZBVeTVmtKS710j6TwnXUPrNgeF
	 4/I0ffLZ6Zgg+oztlcjlnHxl/TX6E/w==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed;
	d=ravnborg.org; s=ed1;
	h=in-reply-to:content-type:mime-version:references:message-id:subject:cc:to:
	 from:date:from;
	bh=PpcTclKxx1k/EfVG4yQr41oM9QVmOB40SVMjWl/npqE=;
	b=OoYC+n7ssdxw6mi4jodInt4BWBrg7fNY89ixy7jkhAqbElGIdulre1GkkC01oXDeMYsAhMsN5uwCw
	 PnTA6SfBw==
X-HalOne-ID: b3232d4d-e5c4-11ed-9b54-99461c6a3fe8
Received: from ravnborg.org (2-105-2-98-cable.dk.customer.tdc.net [2.105.2.98])
	by mailrelay1 (Halon) with ESMTPSA
	id b3232d4d-e5c4-11ed-9b54-99461c6a3fe8;
	Fri, 28 Apr 2023 13:00:52 +0000 (UTC)
Date: Fri, 28 Apr 2023 15:00:50 +0200
From: Sam Ravnborg <sam@ravnborg.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: deller@gmx.de, geert@linux-m68k.org, javierm@redhat.com,
	daniel@ffwll.ch, vgupta@kernel.org, chenhuacai@kernel.org,
	kernel@xen0n.name, davem@davemloft.net,
	James.Bottomley@hansenpartnership.com, arnd@arndb.de,
	linux-fbdev@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-arch@vger.kernel.org, linux-snps-arc@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-ia64@vger.kernel.org,
	loongarch@lists.linux.dev, linux-m68k@lists.linux-m68k.org,
	sparclinux@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-parisc@vger.kernel.org
Subject: Re: [PATCH v2 1/5] fbdev/matrox: Remove trailing whitespaces
Message-ID: <20230428130050.GA3995435@ravnborg.org>
References: <20230428092711.406-1-tzimmermann@suse.de>
 <20230428092711.406-2-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230428092711.406-2-tzimmermann@suse.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230428_060101_308074_DF4BAE11 
X-CRM114-Status: UNSURE (   6.32  )
X-CRM114-Notice: Please train this message.
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

On Fri, Apr 28, 2023 at 11:27:07AM +0200, Thomas Zimmermann wrote:
> Fix coding style. No functional changes.
> 
> Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Sam Ravnborg <sam@ravnborg.org>

	Sam

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
