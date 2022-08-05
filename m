Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37F78C25B08
	for <linux-snps-arc@archiver.kernel.org>; Fri,  5 Aug 2022 09:37:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:Date:Subject:To
	:From:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=+hldAv6ux5NTfJxPRQfFTCmM58AybYAp5FZrVxNQ0p0=; b=d39Si8JdhrTDKb
	clE3jV+DqauuSN5oTjqcusA1m9ECby9qYS2jGE8Jv4aThqdttFV9mnQtl5Etya6ZQwIC9RHERnquz
	aS7f79YIK9+3qIXMBbRMlgVdGepyFvki2C+NgMpmTnhpffQJ5Ib37fL1h6qG/AU1iKxaIYyiyD+Od
	aZDqXgfe6fEK9/eA6Qii/BDjZsdttcF4KUcwszbemzy2bscZ4vciL3R2P2uTrzQE/lxDymKFD88qM
	TktG+oqxKuLraklEZk2woCspKoDaNc5sYdN7yuNfY9r8BYzX/g8m8/0a9QaJit+dvHnS5pNEmgd5k
	LTfr6hpMNpQR9S3rELlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtm9-00Dfop-3s; Fri, 05 Aug 2022 09:37:49 +0000
Received: from bryonye.bartmcqueary.com ([185.246.220.184])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1oJtm2-00DfjZ-9m
	for linux-snps-arc@lists.infradead.org; Fri, 05 Aug 2022 09:37:43 +0000
DKIM-Signature: v=1; a=rsa-sha1; c=relaxed/relaxed; s=dkim; d=bartmcqueary.com;
 h=From:To:Subject:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding; i=tay.dav@bartmcqueary.com;
 bh=u2y4maTsK1zci1O1hwwQXd6v9JY=;
 b=GRVpZdxPGQuN56Pxw65TkMo6S8ZRXBx7clKBkaISJmFS+fraULmApArmnKFGlj76ORKSHURl+3BO
   VI7eQYe55hvzVUYW021bOXR5pz0TRrgwi257y3uiNpEWaA086FTRqNoiw+4BhABgCceCCfdOR+In
   4VoFl55Lp+gCMcZN7TNyTviWOg0SwB5qefQUJo7Ha8O8bv47MFsh0bkpuWdZNtXvAq1r1C6LC9QM
   sYOaEF0KF1eGlCUsvhIad+d395Newft6mN3UOKJmS4Aaf7cgJuWXOW6K+MAcRAkc35zrmKEI9uwn
   kl5S7yRbRYqtKB/7478R6jFihJzDGN6XDjotAg==
DomainKey-Signature: a=rsa-sha1; c=nofws; q=dns; s=dkim; d=bartmcqueary.com;
 b=1l6LM9TTw+l4JMY2lP7F+aFfC+jLrS62O9ST2jY614aHcGMDm73vrTsjYBGr+MmKG3nq+xCERsNm
   CYOcZl6mGwb6sfv29aYL22CZ3YTC6LTe6teRsgp11rIr4RWFwo4m31IBTOPgwI/vW1TE4ezWtd6b
   weG8DboTMNCDf4CtyaxLbYektRGOcT1WKNLslKblDiGc+w+sA7IUt3koGpkW5GTnCDIL3KkKQ9Iw
   iOiTn/aop+PLV4v8u22eoIv+NPUMrolik+TtxsMUC1E4P3AxzqrbAiZd9cmbJvbMRh54XI3xzxjQ
   jq/kq2Ek9u7ttM1wHbyeSBcFQiWfmPXlf9mV2g==;
From: lists.infradead.org  <tay.dav@bartmcqueary.com>
To: linux-snps-arc@lists.infradead.org
Subject: Investment Opportunity
Date: 05 Aug 2022 02:37:35 -0700
Message-ID: <20220805023735.087594CDEDA1D3AE@bartmcqueary.com>
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20220805_023742_527607_0EC398F3 
X-CRM114-Status: UNSURE (  -1.22  )
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

I am an American soldier and before I was serving in the 
UK/American Army base in Scotland UK but right now I am in 
Harasta and I am leading a troop  Syria, I am serving in the 
military of the 3rd Infantry Division in Syria,

I am 48 years old and I have lost my husband for 8 years and I 
have one daughter for him before he dies. 
My address  Room No 65,, Kashmir House Rajaji MargAnsari Square, 
Shahr-e-Naw, Syria.

I want to invest in a company, education, agriculture, real 
estate and any good businesses in your country.
I need someone to help me carry out my mission.
Can I trust you and can you help me?

Write to my inbox in

Emails
anguleanna@gmail.com

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
