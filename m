Return-Path: <linux-snps-arc-bounces+linux-snps-arc=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8403BC2FC14
	for <linux-snps-arc@archiver.kernel.org>; Thu, 17 Aug 2023 12:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=st4Tyzi7isQvm59oLz8p6ZpJZvDTW73WyuUAI00d57U=; b=yNk8/LVruDtbI2
	sJo0Wuhws6BUdFXRr3uaPe0usxOJVAY8cbVogfILF4YfGw6TmH9ewengNHvvi1/JW8etcZEfHgx4A
	0ciwa1KykRY7kuqudZFqLUs2Xah7hLZRVuaw8Te0u64daFh4U9vUvbUVrXzD7jku5h860P94renXa
	ZjqYaf5a4NSQmUrvT8FzQu8qmRVaRea/2J7/ZUNTch9Eg+o5gmG1G2Hm5GGesZ1y7WBkCkoPuPBLM
	ZTnucv4OWYqgYhYw9M1w71uFIltUBY1Rex84eq1f1GSwHtaRvMgfJ7vNrfi/lLFskq9L1iUgySOzZ
	xlS3HCp4qSBIxoI5pRyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbpC-006Lwl-15;
	Thu, 17 Aug 2023 12:10:02 +0000
Received: from mx0a-00230701.pphosted.com ([148.163.156.19])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qWbp9-006Lw0-1L
	for linux-snps-arc@lists.infradead.org;
	Thu, 17 Aug 2023 12:10:00 +0000
Received: from pps.filterd (m0297266.ppops.net [127.0.0.1])
	by mx0a-00230701.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 37H9bHwg010149;
	Thu, 17 Aug 2023 05:09:53 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=synopsys.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-transfer-encoding; s=pfptdkimsnps;
 bh=vzKZb7ddrA2AhX5JAVKXdjp+q+Sx6nEAKkZ15zgEhsI=;
 b=uFpQiUOiA7DBTtRNqWH+VcRgJjnZxWNSc7Jic3uywbNfRbPmK9ETtNh325RHfubPFrlG
 rMvEY6yOsQkc8tItjOZbAeoC1B9x6Qye+rhO+5VbEfknqxy16GQcinP5cwthzuUm1fuK
 M0RRwOIfYgmczzU/xOUEpRQ4QZ/1o/6FlQBz9eJAssb49mBGL5XJ/R1rPtSjMRYlVB6d
 QJbCl5NVpIIQ2ZMsxU79RmvYB0aNwAI+Mkhydy684LB+0OY1QkzYNIULEgY46fQW6hcG
 oM9BwOO1NlRmvUn8cC80JdIm9GrbpK9sWW2Mbnv3KmXpgO/y6/+SmHvcwG3rw9BTGMBa rw== 
Received: from smtprelay-out1.synopsys.com (smtprelay-out1.synopsys.com [149.117.73.133])
	by mx0a-00230701.pphosted.com (PPS) with ESMTPS id 3se9b46fau-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 17 Aug 2023 05:09:52 -0700
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=synopsys.com; s=mail;
	t=1692274192; bh=0bJpxrWyjh/EbMC6ugenzWqkERCMlO+U9TNhuhLUwPQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Vv/iBQc2ZI9A3LjeK91InwJo7XR3tISBGFb8R3qtfkLAq1dFybeXdZs6lx1Xb6LJw
	 hb8f90tc+1weuhShh/7WneEJm0eWJUCgPn1+ANv3CgBQBhOK3d/CxzZ6D5/U6H/NZN
	 sjdp/l5gCcu4CUoQKhSOZiO+zNODIr++aiOQt/xO9Mi5NbpKhK+tlFe90tL75C0YN7
	 UFdTGycPjJi15iBHuWHN++yXu5qaxFIKk8x73Vmu4pAtMLEVRN6mdwjYULFze6beCQ
	 FYW0qA0e/F4rIa/3JANqmZNDjTIV+pFtxG20cTWuFR8qoyUn+3PCx7+l6ynh0B9lF3
	 dNOAqgDRg1Eqw==
Received: from mailhost.synopsys.com (mdc-mailhost2.synopsys.com [10.225.0.210])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256
	 client-signature RSA-PSS (2048 bits) client-digest SHA256)
	(Client CN "mailhost.synopsys.com", Issuer "SNPSica2" (verified OK))
	by smtprelay-out1.synopsys.com (Postfix) with ESMTPS id EA3F640141;
	Thu, 17 Aug 2023 12:09:51 +0000 (UTC)
Received: from SNPS-o0WHuHJU73.internal.synopsys.com (snps-o0whuhju73.internal.synopsys.com [10.116.105.184])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits))
	(Client did not present a certificate)
	by mailhost.synopsys.com (Postfix) with ESMTPSA id 066B6A005E;
	Thu, 17 Aug 2023 12:09:48 +0000 (UTC)
X-SNPS-Relay: synopsys.com
From: Pavel.Kozlov@synopsys.com
To: Vineet Gupta <vgupta@kernel.org>, linux-snps-arc@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, Shahab Vahedi <Shahab.Vahedi@synopsys.com>,
        Alexey Brodkin <Alexey.Brodkin@synopsys.com>
Subject: Re: [PATCH 20/20] ARC: pt_regs: create seperate type for ecr
Date: Thu, 17 Aug 2023 16:09:35 +0400
Message-Id: <20230817120935.59181-1-kozlov@synopsys.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20230815004813.555115-21-vgupta@kernel.org>
References: <20230815004813.555115-21-vgupta@kernel.org>
MIME-Version: 1.0
X-Proofpoint-GUID: 6vQ64l68s-lNhEpUGn3JrjVuhJ8FHUXA
X-Proofpoint-ORIG-GUID: 6vQ64l68s-lNhEpUGn3JrjVuhJ8FHUXA
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-08-17_05,2023-08-17_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_active_cloned_notspam policy=outbound_active_cloned score=0
 clxscore=1015 spamscore=0 suspectscore=0 priorityscore=1501
 mlxlogscore=999 impostorscore=0 mlxscore=0 bulkscore=0 adultscore=0
 malwarescore=0 lowpriorityscore=0 phishscore=0 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.12.0-2306200000
 definitions=main-2308170110
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230817_050959_479699_3A88DBF0 
X-CRM114-Status: GOOD (  16.43  )
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

Hi Vineet,

I'm testing your updates and ran into the same build issue reported by the build 
robot.
http://lists.infradead.org/pipermail/linux-snps-arc/2023-August/007522.html

> #ifdef CONFIG_ISA_ARCOMPACT
> @@ -40,18 +51,7 @@ struct pt_regs {
>           *        Last word used by Linux for extra state mgmt (syscall-restart)
>           * For interrupts, use artificial ECR values to note current prio-level
>           */
> -       union {
> -               struct {
> -#ifdef CONFIG_CPU_BIG_ENDIAN
> -                       unsigned long state:8, ecr_vec:8,
> -                                     ecr_cause:8, ecr_param:8;
> -#else
> -                       unsigned long ecr_param:8, ecr_cause:8,
> -                                     ecr_vec:8, state:8;
> -#endif
> -               };
> -               unsigned long event;
> -       };
> +       ecr_reg ecr;
> }
>
> #define MAX_REG_OFFSET offsetof(struct pt_regs, event)

This change causes a build issue for ARC700, as the event field has been
removed and the MAX_REG_OFFSET macro hasn't been updated.

Regards,
Pavel

_______________________________________________
linux-snps-arc mailing list
linux-snps-arc@lists.infradead.org
http://lists.infradead.org/mailman/listinfo/linux-snps-arc
