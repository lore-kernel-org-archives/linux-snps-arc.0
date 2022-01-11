Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B43B7C433F5
	for <linux-snps-arc@archiver.kernel.org>; Tue, 11 Jan 2022 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Subject:To:From:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=bkY8Z4mEzDCqBydaHVWDP8dRxexxl8gADjd7+n9Q+RQ=; b=tj9FWowYruQ4H1
	+WWhAqdMTH86xtejqyMsJa4m2+fhOzSyVswVNDlkDPu8RrK24LFaVPpjCGpJD66Dve0lUImftwva2
	8eakz/Zkiu+MtDUu5fZpTCZ5p+i/2MlPDTbBk6bKx0ITRD5zJDTbJEsj1AqWMdeMkEtl3sXs2P8wJ
	PttoVcjU92chxZ28anTv/ebkPcabKV+YaHpwlzd6VnTHgA0z46J0J7EQl0dEsDFSouIkRLOsr8lC9
	7WfeTIGFshKMei8xEzmrWw8JqnFzbATkeUKZn++wzE1kPLnM7UWobBB8qGDxXVl2xwmARJO2md/Ky
	r19GnYijpcnZVeldOUfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1n7Buc-00FBNP-6G; Tue, 11 Jan 2022 07:49:46 +0000
Received: from mail.betterbiz.pl ([45.86.209.138])
 by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
 id 1n7BuZ-00FBMD-77
 for linux-snps-arc@lists.infradead.org; Tue, 11 Jan 2022 07:49:44 +0000
Received: by mail.betterbiz.pl (Postfix, from userid 1001)
 id D606A82AEE; Tue, 11 Jan 2022 02:46:06 -0500 (EST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=betterbiz.pl; s=mail;
 t=1641887382; bh=07NAgW1e0WiNB9zqagiM2BnwZfWBCpNa2E4+ccxBPgw=;
 h=Date:From:To:Subject:From;
 b=WUv/DCTn6J4UdJ/V46u3e5oiGrpl0MZTwMI9cMpiA/jlsQEXw8+1BdJvmaSlZRCw0
 TKqxbrQfMtXHv2L2MLI06HvWI75ZgzV5vuQIUpxG+hQ/AhP+LMSTtLcC5wfOMC8+Vw
 5hzdFnzu2+1Ym5ToAImcOK/irLslNhI8r/Cg7osnv33mmbw/CwJ7hvU5lP6W+xoRkM
 aoW8tKpJ9jrloEyMqYQZYYrH23TXAw7cJUckamDtXMgb2hqakSlF7E2G0AB4pS/XDk
 i5WQmZIHEWitHm/lS+lrgUAZZkv+88VeAAiX1Hsmr5MdM8L/GvVNTOGdSh5zd+ZEzJ
 kCWwRoQ3hcb6g==
Received: by mail.betterbiz.pl for <linux-snps-arc@lists.infradead.org>;
 Tue, 11 Jan 2022 07:45:59 GMT
Message-ID: <20220111024500-0.1.o.zcc.0.x4rwc3vnq6@betterbiz.pl>
Date: Tue, 11 Jan 2022 07:45:59 GMT
From: "Jakub Daroch" <jakub.daroch@betterbiz.pl>
To: <linux-snps-arc@lists.infradead.org>
Subject: Wycena paneli fotowoltaicznych
X-Mailer: mail.betterbiz.pl
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220110_234943_293323_839C4D83 
X-CRM114-Status: UNSURE (   1.07  )
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Sender: "linux-snps-arc" <linux-snps-arc-bounces@lists.infradead.org>
Errors-To: linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org

RHppZcWEIGRvYnJ5LAoKZG9zdHJ6ZWdhbSBtb8W8bGl3b8WbxIcgd3Nww7PFgnByYWN5IHogUGHF
hHN0d2EgZmlybcSFLgoKxZp3aWFkY3p5bXkga29tcGxla3Nvd8SFIG9ic8WCdWfEmSBpbndlc3R5
Y2ppIHcgZm90b3dvbHRhaWvEmSwga3TDs3JhIG9ibmnFvGEga29zenR5IGVuZXJnaWkgZWxla3Ry
eWN6bmVqIG5hd2V0IG8gOTAlLgoKQ3p5IHPEhSBQYcWEc3R3byB6YWludGVyZXNvd2FuaSB3ZXJ5
ZmlrYWNqxIUgd3N0xJlwbnljaCBwcm9wb3p5Y2ppPwoKClBvemRyYXdpYW0sCkpha3ViIERhcm9j
aAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KbGludXgt
c25wcy1hcmMgbWFpbGluZyBsaXN0CmxpbnV4LXNucHMtYXJjQGxpc3RzLmluZnJhZGVhZC5vcmcK
aHR0cDovL2xpc3RzLmluZnJhZGVhZC5vcmcvbWFpbG1hbi9saXN0aW5mby9saW51eC1zbnBzLWFy
Ywo=
