import { Request, Response, NextFunction } from 'express';
import jwt from 'jsonwebtoken';

export const verifyToken = (req: Request, res: Response, next: NextFunction): void => {
    const authHeader = req.headers['authorization'];
    const token = authHeader && authHeader.startsWith('Bearer ')
        ? authHeader.split(' ')[1]
        : undefined;

    if (!token) {
        res.status(401).json({ success: false, message: 'Akses ditolak. Token tidak ditemukan!' });
        return;
    }

    try {
        const decoded = jwt.verify(token, process.env.JWT_SECRET as string) as { id: number };
        res.locals.userId = decoded.id;
        next();
    } catch (error) {
        console.error('JWT error:', (error as Error).message);
        res.status(403).json({ success: false, message: 'Sesi tidak valid atau kedaluwarsa!' });
    }
};